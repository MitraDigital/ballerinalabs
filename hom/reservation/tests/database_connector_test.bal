import ballerina/test;
import ballerina/config;

@test:Config
function testDBConnectorSuccess() {

    ReservationDbData reservationDbData ;
    DatabaseConnector dbConnector;

    dbConnector.dbConfig.jdbcClientConfig.url = config:getAsString("JDBC_URL_HOTEL1");
    dbConnector.dbConfig.jdbcClientConfig.username = config:getAsString("MYSQL_USER_HOTEL1");
    dbConnector.dbConfig.jdbcClientConfig.password = config:getAsString("MYSQL_PASSWORD_HOTEL1");

    reservationDbData.hotel =   "Reservation";
    reservationDbData.tableName =   "Reservation";
    reservationDbData.customerID = "11111111v";
    reservationDbData.customerName = "testCust2";
    reservationDbData.customerAddress = "testCus2 Addr";
    reservationDbData.customerEmail = "test12345@gmail.com";
    reservationDbData.startDate = "2018-10-12";
    reservationDbData.endDate =  "2018-10-14";
    reservationDbData.package = "standard";
    reservationDbData.fullAmount = 20000.00;
    reservationDbData.advanceAmount =  12000.00;

    var dbResult  = dbConnector.InsertOperation(reservationDbData);

    int expectedResult = 1;
    test:assertEquals(dbResult, expectedResult, msg = "Database insert is not successful");

}

@test:Config
function testDBConnectorInvalidTable() {

    ReservationDbData reservationDbData ;
    DatabaseConnector dbConnector;

    dbConnector.dbConfig.jdbcClientConfig.url = config:getAsString("JDBC_URL_HOTEL1");
    dbConnector.dbConfig.jdbcClientConfig.username = config:getAsString("MYSQL_USER_HOTEL1");
    dbConnector.dbConfig.jdbcClientConfig.password = config:getAsString("MYSQL_PASSWORD_HOTEL1");

    reservationDbData.hotel =   "test";
    reservationDbData.tableName =   "test";
    reservationDbData.customerID = "11111111v";
    reservationDbData.customerName = "testCust2";
    reservationDbData.customerAddress = "testCus2 Addr";
    reservationDbData.customerEmail = "test12345@gmail.com";
    reservationDbData.startDate = "2018-10-12";
    reservationDbData.endDate =  "2018-10-14";
    reservationDbData.package = "standard";
    reservationDbData.fullAmount = 20000.00;
    reservationDbData.advanceAmount =  12000.00;

    var dbResult  = dbConnector.InsertOperation(reservationDbData);

    error errorResponse ;
    errorResponse.message = "Error performing SQL query";
    var expectedResult = errorResponse;
    test:assertEquals(dbResult, expectedResult, msg = "Database insert is not successful");

}