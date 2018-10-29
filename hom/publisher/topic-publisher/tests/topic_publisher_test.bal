import ballerina/http;
import ballerina/test;

endpoint http:Client publisherEP {
    url: "http://localhost:9094/Topic"
};

@test:Config
function testResourcePublishMessage() {

    http:Request req;
    // Construct a request payload
    xml payload = xml `<message>message</message>`;
    req.setXmlPayload(payload);
    // Send a 'post' request and obtain the response
    http:Response response = check publisherEP->post("/publishMessage", req);
    // Expected response code is 200
    test:assertEquals(response.statusCode, 200, msg = "publisher service did not respond with 200 OK signal!");
    // Check whether the response is as expected
    xml resPayload = check response.getXmlPayload();
    xml expected = xml `<message>Success</message>`;
    test:assertEquals(resPayload, expected, msg = "Response mismatch!");
}