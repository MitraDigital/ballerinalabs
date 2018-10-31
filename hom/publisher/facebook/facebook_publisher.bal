import ballerina/config;
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
            accessToken:config:getAsString("FACEBOOK_TOKEN")
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
                var response = facebookEP -> createPost(config:getAsString("FACEBOOK_PAGE_ID"), messageText, "", "");
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