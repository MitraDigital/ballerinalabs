import ballerina/test;
import ballerina/http;

endpoint http:Client clientEP {
    url:"http://localhost:9094/publisher"
};

@test:Config
function testFacebookPublisherService() {

    //json payload = {
    //    "post": {
    //        "title": "5% offer at Trillium hotel",
    //        "fromDate": "31/02/2018",
    //        "toDate": "01/12/2018",
    //        "url": "www.trillium.com"
    //    }
    //};
    //http:Request request = new;
    //request.setJsonPayload(payload);
    //
    //var response = clientEP -> execute("POST", "/facebook", request);
    //
    //match response {
    //    http:Response res => {
    //
    //        int status = res.statusCode;
    //        int expectedStatus = 200;
    //        test:assertEquals(status, expectedStatus, msg = "Facebook publisher service did not respond with 200 OK signal!");
    //
    //        json resPayload = check res.getJsonPayload();
    //        json expectedPayload = {"result":"published"};
    //        test:assertEquals(resPayload, expectedPayload, msg = "Facebook publisher Response mismatch!");
    //
    //    }
    //    error err => {
    //        test:assertFail(msg = "Endpoint Error Occured" + err.message);
    //    }
    //}
}

