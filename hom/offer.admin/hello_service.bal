// A system package containing protocol access constructs
// Package objects referenced with 'http:' in code
import ballerina/http;
import ballerinax/docker;
import ballerinax/kubernetes;

# A service endpoint represents a listener.
@kubernetes:Ingress {
    hostname: "webinar.mitra.com",
    name: "offer-service",
    path: "/offer"
}
@kubernetes:Service {
    serviceType: "NodePort",
    name: "offer-service"
}
endpoint http:Listener listener {
    port: 9090
};

//Service annotations
@kubernetes:Deployment {
    dockerHost: "tcp://192.168.99.100:2376",
    dockerCertPath: "/home/kapila/.minikube/certs"
}

service<http:Service> hello bind listener {

    # A resource is an invokable API method
    # Accessible at '/hello/sayHello
    #'caller' is the client invoking this resource 

    # + caller - Server Connector
    # + request - Request

    sayHello(endpoint caller, http:Request request) {

        // Create object to carry data back to caller
        http:Response response = new;

        // Objects and structs can have function calls
        response.setTextPayload("Hello Ballerina!\n");

        // Send a response back to caller
        // Errors are ignored with '_'
        // -> indicates a synchronous network-bound call
        _ = caller->respond(response);
    }
}