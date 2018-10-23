// A system package containing protocol access constructs
// Package objects referenced with 'http:' in code
import ballerina/http;
import ballerinax/docker;

# A service endpoint represents a listener.
@docker:Expose {}
endpoint http:Listener listener {
    port:9090
};

# A service is a network-accessible API
# Advertised on '/hello', port comes from listener endpoint

@docker:Config {
    name: "bal-web1.notify",
    push: true,
    tag: "0.0.1",
    buildImage: true,
    registry:"index.docker.io/mitrai",
    username: "mitrai",
    password: "itemsthissingle"
}
service<http:Service> hello bind listener {

    # A resource is an invokable API method
    # Accessible at '/hello/sayHello
    #'caller' is the client invoking this resource 

    # + caller - Server Connector
    # + request - Request

    sayHello (endpoint caller, http:Request request) {

        // Create object to carry data back to caller
        http:Response response = new;

        // Objects and structs can have function calls
        response.setTextPayload("Hello Ballerina!\n");

        // Send a response back to caller
        // Errors are ignored with '_'
        // -> indicates a synchronous network-bound call
        _ = caller -> respond(response);
    }
}