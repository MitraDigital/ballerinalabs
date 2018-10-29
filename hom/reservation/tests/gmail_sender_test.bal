import ballerina/log;
import ballerina/test;

@test:Config
function testGmailSender() {
    log:printDebug("Gmail Integration -> Sending notification to customers");

    ReservationEmailData reservationEmailData = new;
    reservationEmailData.cutomerName = "Sawani Dissanayake";
    reservationEmailData.customerEmail = "esawani36@gmail.com";
    reservationEmailData.subject = "Thank You for Reservation";

    GmailSender gmailSender;
    boolean result = gmailSender.sendNotification(reservationEmailData);

    test:assertTrue(result, msg = "Gmail- Integration -> Sending notification to customers successfull!");
}
