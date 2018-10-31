import ballerina/http;
import ballerina/log;
import ballerina/jms;
import ballerina/io;
jms:Connection jmsConnection = new({
        initialContextFactory: "org.apache.activemq.jndi.ActiveMQInitialContextFactory",
        providerUrl: "tcp://localhost:32768"
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
@http:ServiceConfig {
    basePath:"/Topic",
    allowHeaders: ["Content-Type","Access-Control-Allow-Origin"],
}
service<http:Service> bookstoreService bind listener {
    // Resource that allows users to place an order for a book
    @http:ResourceConfig {
        methods:["POST"],
        consumes:["application/json"],
        produces:["application/json"]
    }
    publishMessage(endpoint caller, http:Request request) {
        http:Response response;
        json requestPayload;
        json responseMessage;
        match request.getJsonPayload() {
            // Valid JSON payload
            json payload => requestPayload = payload;
            // NOT a valid JSON payload
            any => {
                response.statusCode = 400;
                response.setJsonPayload({ "Message": "Invalid payload - Not a valid JSON payload" });
                _ = caller->respond(response);
                done;
            }
        }
        jms:Message topicMessage = check jmsSession.createTextMessage(requestPayload.toString());
        topicPublisher->send(topicMessage) but {
            error e => log:printError("Error occurred while sending "
                    + "message", err=e)
        };
        responseMessage = { "Message": "Offer Published Successfully !" };
        response.setJsonPayload(responseMessage);
        _ = caller->respond(response);
    }
}