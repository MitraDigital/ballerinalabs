import ballerina/http;
import ballerina/log;
import ballerina/io;

endpoint http:Client clientEndpoint {
    url: "http://localhost"
};

@http:ServiceConfig {
    basePath: "/reserve"
}
service<http:Service> reserve bind { port: 9080 } {

    @http:ResourceConfig {
        methods: ["POST"],
        path: "/"
    }
    hotel (endpoint caller, http:Request request) {
        http:Response res = new;

        var payload = request.getJsonPayload();

        match payload {
            json jsonPayload => {
                log:printInfo("Invoking Routing Service");
                string hotel = check <string> jsonPayload.hotelId;
                string reqUrl = "";
                if (hotel == "trinco"){
                    reqUrl = ":9096/"+hotel+"/reservation";
                }
                else if (hotel == "yala"){
                    reqUrl = ":9095/"+hotel+"/reservation";
                }
                else{
                    res.statusCode = 500;
                    res.setJsonPayload({"status":"Invalid hotel"});
                }
                var response = clientEndpoint->post(untaint reqUrl, untaint jsonPayload);
                io:println(response);
                match response {
                    http:Response resp => {
                        io:println("POST request:");
                        var msg = resp.getJsonPayload();
                        match msg {
                            json jsonPayload2 => {
                                io:println(jsonPayload2);
                                res.setJsonPayload(jsonPayload2);
                            }
                            error err => {
                                log:printError(err.message, err = err);
                            }
                        }
                    }
                    error err => { log:printError(err.message, err = err); }
                }

            }
            error err => {
                res.statusCode = 500;
                res.setPayload(untaint err.message);
            }
        }

        caller->respond(res) but { error e => log:printError("Error sending response", err = e) };
    }
}