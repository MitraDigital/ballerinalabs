import ballerina/io;
import ballerina/mysql;
import ballerina/jdbc;
import ballerina/log;
import ballerina/config;

public type DatabaseConnector object  {

    public DatabaseConfig dbConfig;

    public function InsertOperation(ReservationDbData reservationDbData) returns (int|error);
};

function DatabaseConnector::InsertOperation(ReservationDbData reservationDbData) returns (int|error){

    endpoint jdbc:Client reservationDB;
    reservationDB.init(self.dbConfig.jdbcClientConfig);

    error initialError ;
    initialError.message = "Error performing SQL query";

    string sanatizedTableName = Sanitize(reservationDbData.tableName);
    string sqlQuery = "INSERT INTO "+ sanatizedTableName + "(CustomerID,CustomerName,CustomerAddress,CustomerEmail,StartDate,EndDate,Package,FullAmount) VALUES(?,?,?,?,?,?,?,?);";

    int|error insertStatus = initialError;

    transaction with retries = 4, oncommit = onCommitFunction,
                     onabort = onAbortFunction {
        var resultStatus = reservationDB->update(sqlQuery,reservationDbData.customerID,reservationDbData.customerName,reservationDbData.customerAddress,reservationDbData.customerEmail,reservationDbData.startDate,reservationDbData.endDate,reservationDbData.package,reservationDbData.fullAmount);

        match resultStatus {
            int resultInt => {
                log:printInfo("Insert Sucessful for customerID : "+reservationDbData.customerID);
                insertStatus = resultInt;
            }
            error e => {
                log:printError("Insert failed for customerID : "+reservationDbData.customerID + " Error : "+e.message);
                insertStatus =  e;
                abort;
            }
        }
    } onretry {
        log:printInfo("Retrying transaction");
    }

    return insertStatus;
}

public function Sanitize(string input) returns @untainted string {
    string regEx = "[^a-zA-Z-0-9]+";
    return input.replace(regEx, "");
}

public function onCommitFunction(string transactionId) {
    log:printInfo("Transaction: " + transactionId + " committed");
}

public function onAbortFunction(string transactionId) {
    log:printError("Transaction: " + transactionId + " aborted");
}