import ballerina/io;
import ballerina/log;
import ballerina/http;
import ballerina/config;
import ballerinax/docker;
import reservation;

@http:ServiceConfig { basePath: "/trinco" }
service<http:Service> trincoReservationService bind { port: 9096 } {

    @http:ResourceConfig {
        methods: ["POST"],
        path: "/reservation"
    }
    addReservation(endpoint caller, http:Request req) {

        http:Response res = new;
        json insertStatusJson = {};

        var payload = req.getJsonPayload();

        match payload {
            json jsonPayload => {


                log:printInfo("Invoking Trinco Reservation Service");

                reservation:ReservationDbData reservationDbData ;
                reservation:DatabaseConnector dbConnector;

                reservation:ReservationEmailData reservationEmailData;
                reservation:GmailSender gmailSender;

                dbConnector.dbConfig.jdbcClientConfig.url = config:getAsString("JDBC_URL_HOTEL2");
                dbConnector.dbConfig.jdbcClientConfig.username = config:getAsString("MYSQL_USER_HOTEL2");
                dbConnector.dbConfig.jdbcClientConfig.password = config:getAsString("MYSQL_PASSWORD_HOTEL2");

                reservationDbData.hotel =   "Reservation";
                reservationDbData.tableName =   "Reservation";
                reservationDbData.customerID = check <string>jsonPayload.customerId;
                reservationDbData.customerName = check <string>jsonPayload.customerName;
                reservationDbData.customerAddress = check <string>jsonPayload.customerAddr;
                reservationDbData.customerEmail = check <string>jsonPayload.customerEmail;
                reservationDbData.startDate = check <string>jsonPayload.checkIn;
                reservationDbData.endDate =  check <string>jsonPayload.checkOut;
                reservationDbData.package = check <string>jsonPayload.package;
                reservationDbData.fullAmount = check <float>jsonPayload.fullAmount;
                reservationDbData.advanceAmount = check <float>jsonPayload.advanceAmount;

                reservationEmailData.cutomerName = check <string>jsonPayload.customerName;
                reservationEmailData.customerEmail = check <string>jsonPayload.customerEmail;
                reservationEmailData.subject = "Thank You for Reservation";

                var dbResponseInt  = dbConnector.InsertOperation(reservationDbData);

                if(dbResponseInt == 1){
                    if(gmailSender.sendNotification(reservationEmailData)) {
                        res.statusCode = 200;
                        insertStatusJson = { "status": "Reservation request is sent successfully" };
                    }
                    else{
                        res.statusCode = 500;
                        insertStatusJson = { "status": "Reservation request is sent. Error in sending notification email." };
                    }
                }
                else{
                    res.statusCode = 500;
                    insertStatusJson ={"status":"Reservation request cannot be sent"};
                }

                res.setPayload(insertStatusJson);
            }
            error err => {
                res.statusCode = 500;
                res.setPayload(untaint err.message);
            }
        }

        caller->respond(res) but { error e => log:printError("Error sending response", err = e) };
    }
}

