import ballerina/config;
import ballerina/internal;
import ballerina/http;
import ballerina/io;
import ballerina/jms;
import ballerina/log;
import wso2/facebook;

type FbPost record {
    string title;
    string toDate;
    string fromDate;
    string url;
};

type JsonPayload record {
    FbPost post;
};

endpoint facebook:Client facebookEP {
    clientConfig:{
        auth:{
            accessToken:"EAAfFreUnYFEBAEZB8myEeb8kK5UXCLw6QqeT5Hg6nh4FaH7QebPnUa2r5eb87QZC4T4oo2Cq4ZCTyJZAfuf0UAzZAhMlZCyaBiZBABZCZBBXO5zuW2a3acbV9EYZCSKOMz24mvdf777ZAXYYDs7AuIVx6KYVEmnRzI9G0gbElZBLjAh7fbahACsc9z0R"
        }
    }
};

jms:Connection jmsSubscriberConnection = new({
        initialContextFactory: "org.apache.activemq.jndi.ActiveMQInitialContextFactory",
        providerUrl: "tcp://localhost:32768"
    });

jms:Session jmsSubscriberSession = new(jmsSubscriberConnection, {
        acknowledgementMode: "AUTO_ACKNOWLEDGE"
    });

endpoint jms:TopicSubscriber subscriberEndpoint {
    session:jmsSubscriberSession,
    topicPattern:"BallerinaTopic"
};

service<jms:Consumer> jmsListener bind subscriberEndpoint {

    onMessage(endpoint subscriber, jms:Message message) {
        match (message.getTextMessageContent()) {
            string messageText => {
                log:printInfo("Message : " + messageText);
                json jsonMessage=internal:parseJson(messageText) but { error => log:printError("Error parsing JSON") };
                json offerMessage=jsonMessage["message"];
                json offerid=jsonMessage["offerid"];
                log:printInfo("Offer message : " + offerMessage.toString());

                var response = facebookEP -> createPost("2134876629909100", offerMessage.toString() , "", "");
                        match response {
                            facebook:Post fbPost => {
                                io:println(fbPost);
                                io:println("Post published");
                            }
                            facebook:FacebookError err => {
                                io:println(err);
                                io:println("Post pubishing error " + err.message);
                            }
                        }

            }
            error e => log:printError("Error occurred while reading message", err=e);
        }
    }
}