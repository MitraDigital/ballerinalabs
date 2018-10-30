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
        

        var payload = check request.getJsonPayload();

        match payload {
            json jsonPayload => {
                string hotel = check <string> jsonPayload.hotelId;
            }
            error err => {
                res.statusCode = 500;
                res.setPayload(untaint err.message);
            }
        }
    }
}
