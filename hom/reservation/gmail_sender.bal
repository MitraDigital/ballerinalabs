import ballerina/io;
import ballerina/config;
import ballerina/log;
import wso2/gmail;

public type GmailSender object  {
    public function sendNotification(ReservationEmailData reservationEmailData) returns (boolean);
};

function GmailSender::sendNotification(ReservationEmailData reservationEmailData) returns (boolean) {
    return sendMail(reservationEmailData.customerEmail, reservationEmailData.subject, getCustomEmailTemplate(reservationEmailData.cutomerName));
}

function getCustomEmailTemplate(string customerName) returns (string) {
    string emailTemplate = "<h2> Hi " + customerName + " </h2>";
    emailTemplate = emailTemplate + "<h3> Thank you for your reservation "  + " ! </h3>";
    emailTemplate = emailTemplate + "<p> If you have any questions regarding the reservation" +
        ", please contact us and we will get in touch with you right away ! </p> ";
    return emailTemplate;
}

function sendMail(string customerEmail, string subject, string messageBody) returns (boolean) {

    endpoint gmail:Client gmailClient {
        clientConfig: {
            auth: {
                accessToken: config:getAsString("GMAIL_ACCESS_TOKEN"),
                refreshToken: config:getAsString("GMAIL_REFRESH_TOKEN"),
                clientId: config:getAsString("GMAIL_CLIENT_ID"),
                clientSecret: config:getAsString("GMAIL_CLIENT_SECRET")
            }
        }
    };

    string gmailSenderEmail = config:getAsString("GMAIL_SENDER");
    string gmailUserId = config:getAsString("GMAIL_USER_ID");

    //Create html message
    gmail:MessageRequest messageRequest;
    messageRequest.recipient = customerEmail;
    messageRequest.sender = gmailSenderEmail;
    messageRequest.subject = subject;
    messageRequest.messageBody = messageBody;
    messageRequest.contentType = gmail:TEXT_HTML;

    //Send mail
    var sendMessageResponse = gmailClient->sendMessage(gmailUserId, untaint messageRequest);
    string messageId;
    string threadId;
    match sendMessageResponse {
        (string, string) sendStatus => {
            (messageId, threadId) = sendStatus;
            log:printInfo("Sent email to " + customerEmail + " with message Id: " + messageId + " and thread Id:"
                    + threadId);
            return true;
        }
        gmail:GmailError e => {
            log:printInfo(e.message);
            return false;
        }
    }
}
