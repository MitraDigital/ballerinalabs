import ballerina/jdbc;

public type ReservationDbData record {
    string tableName;
    string hotel;
    string customerID;
    string customerName;
    string customerAddress;
    string customerEmail;
    string startDate;
    string endDate;
    string package;
    string fullAmount;
    float advanceAmount;
};

public type ReservationEmailData object {
    public string cutomerName;
    public string customerEmail;
    public string subject;
};

public type DatabaseConfig record {
    jdbc:ClientEndpointConfiguration jdbcClientConfig;
};

