import ballerina/config;
import ballerina/http;
import ballerina/io;
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
            accessToken:config:getAsString("ACCESS_TOKEN")
        }
    }
};

@http:ServiceConfig {
    basePath: "/publisher"
}
service<http:Service> MediaPublisher bind { port: 9094 } {

    @http:ResourceConfig {
        methods: ["POST"],
        path: "/facebook"
    }
    publishFacebook(endpoint caller, http:Request req) {
        http:Response res = new;

        var requestJson = check req.getJsonPayload();

        io:println(requestJson);
        JsonPayload jsonPayload = check <JsonPayload> requestJson;
        string url = jsonPayload.post.url;
        string title = jsonPayload.post.title + " Valid from " + jsonPayload.post.fromDate + " until "
            + jsonPayload.post.toDate + ". Visit " + url + " for more details.";

        //var response = facebookEP -> createPost(config:getAsString("PAGE_ID"),title,"","");
        //match response {
        //    facebook:Post fbPost => {
        //        io:println(fbPost);
        //        res.setPayload("Post published");
        //        res.statusCode = 201;
        //    }
        //    facebook:FacebookError err => {
        //        io:println(err);
        //        res.setPayload("Post pubishing error " + err.message);
        //        res.statusCode = 500;
        //    }
        //}

        //Following code will be replace with actual facebook response later
        json responseJson = {"result" : "published"};

        res.setJsonPayload(responseJson);
        res.statusCode = 200;

        io:println(res);
        caller->respond(res) but { error e => io:println("Error sending response") };
    }
}
