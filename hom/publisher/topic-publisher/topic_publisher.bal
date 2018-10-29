import ballerina/http;
import ballerina/log;
import ballerina/jms;
import ballerina/io;


jms:Connection jmsConnection = new({
        initialContextFactory: "org.apache.activemq.jndi.ActiveMQInitialContextFactory",
        providerUrl: "tcp://localhost:61616"
    });

// Initialize a JMS session on top of the created connection
jms:Session jmsSession = new(jmsConnection, {
        acknowledgementMode: "AUTO_ACKNOWLEDGE"
    });

// Initialize a topic publisher using the created session
endpoint jms:TopicPublisher topicPublisher {
    session:jmsSession,
    topicPattern:"BallerinaTopic"
};

endpoint http:Listener listener {
    port:9094
};

@http:ServiceConfig {basePath:"/Topic"}
service<http:Service> topicPublisherService bind listener {
    @http:ResourceConfig {methods:["POST"], consumes:["application/xml"],
        produces:["application/xml"]}

    publishMessage(endpoint caller, http:Request request) {
        http:Response response;
        xml requestPayload;

        match request.getXmlPayload() {
            xml payload => requestPayload = payload;
            any => {
                response.statusCode = 400;
                response.setXmlPayload(xml `<error>Error</error>`);
                _ = caller->respond(response);
                done;
            }
        }

        jms:Message topicMessage = check jmsSession.createTextMessage(<string> requestPayload);
        topicPublisher->send(topicMessage) but {
            error e => log:printError("Error occurred while sending "
                    + "message", err=e)
        };

        response.setXmlPayload(xml `<message>Success</message>`);
        _ = caller->respond(response);
    }
}
