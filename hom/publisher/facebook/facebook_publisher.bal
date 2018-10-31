import ballerina/config;
import ballerina/http;
import ballerina/io;
import ballerina/jms;
import wso2/facebook;
import ballerinax/kubernetes;

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
        providerUrl: "tcp://localhost:61616"
    });

jms:Session jmsSubscriberSession = new(jmsSubscriberConnection, {
        acknowledgementMode: "AUTO_ACKNOWLEDGE"
    });

endpoint jms:TopicSubscriber subscriberEndpoint {
    session:jmsSubscriberSession,
    topicPattern:"BallerinaTopic"
};

@kubernetes:Ingress {
    hostname:"webinar.mitra.com",
    name:"facebook-publisher-service",
    path:"/facebook-publisher"
}
@kubernetes:Service {
    serviceType:"NodePort",
    name:"facebook-publisher-service"
}
endpoint http:Listener listener {
    port:9090,
    secureSocket:{
        keyStore:{
            path:"${ballerina.home}/bre/security/ballerinaKeystore.p12",
            password:"ballerina"
        }
    }
};

//Service annotations
@kubernetes:Deployment {
    dockerHost:"tcp://192.168.99.100:2376",
    dockerCertPath:"/home/kapila/.minikube/certs",
    copyFiles:[{target:"/ballerina/runtime/bre/lib",
                source:"./conf/activemq-client-5.15.7.jar"}],
    copyFiles:[{target:"/ballerina/runtime/bre/lib",
        source:"./conf/geronimo-j2ee-management_1.1_spec-1.0.1.jar"}],
    copyFiles:[{target:"/ballerina/runtime/bre/lib",
        source:"./conf/hawtbuf-1.11.jar"}]
}

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