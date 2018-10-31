import ballerina/http;
import ballerina/test;

endpoint http:Client publisherEP {
    url: "http://localhost:9094/Topic"
};

@test:Config
function testResourcePublishMessage() {

    http:Request req;
    // Construct a request payload
    json payload = {
        "SinglePropertyHospitalityOffers" : {
            "HospitalityOffers" : {
                "@type" : "HospitalityOffers",
                "objID" : "hospitalityOffers_1",
                "Identifier" : {
                    "value" : "guid12345",
                    "url" : "http://www.w3.org/2001/XMLSchema",
                    "system" : "sysABC3344",
                    "organization" : "Acme"
                },
                "HospitalityOffersRef" : "hospitalityOffers_1",
                "FacilityIdentifier" : {
                    "objID" : "facility_1",
                    "FacilityRef" : "facility_1",
                    "FacilityKey" : {
                        "@type" : "FacilityKeyIdentifier",
                        "Identifier" : {
                            "value" : "guid12345",
                            "url" : "http://www.OpenTravel.org/ns/OTA2/Common_v01_00",
                            "system" : "sysABC3344",
                            "organization" : "Acme"
                        }
                    }
                },
                "Offer" : [ {
                    "@type" : "Offer",
                    "objID" : "offer_1",
                    "vendor" : "Vendor Name",
                    "taxExcludedInd" : true,
                    "Identifier" : {
                        "value" : "guid12345",
                        "url" : "http://www.w3.org/2001/XMLSchema",
                        "system" : "sysABC3344",
                        "organization" : "Acme"
                    },
                    "OfferRef" : "offer_1",
                    "TotalPrice" : {
                        "@type" : "TotalPrice",
                        "estimateInd" : true,
                        "taxExcludedInd" : true,
                        "Total" : {
                            "value" : 80000,
                            "currencyCode" : "USD",
                            "minorUnit" : 2
                        },
                        "ProductPrice" : [ {
                            "@type" : "ProductPriceHospitality",
                            "taxExcludedInd" : true,
                            "feesIncludedInd" : true,
                            "gratuityIncludedInd" : true,
                            "Price" : {
                                "@type" : "PriceDetail",
                                "unitPrice" : 100.0000,
                                "unitName" : "Example String Value",
                                "quantity" : 1234,
                                "percentage" : 10,
                                "description" : "Example String Value",
                                "maxQuantity" : 2345,
                                "Total" : {
                                    "value" : 80000,
                                    "currencyCode" : "USD",
                                    "minorUnit" : 2
                                },
                                "ChargeUnit" : {
                                    "value" : "Per unit"
                                }
                            },
                            "Taxes" : {
                                "@type" : "Taxes",
                                "Total" : {
                                    "value" : 80000,
                                    "currencyCode" : "USD",
                                    "minorUnit" : 2
                                },
                                "Tax" : [ {
                                    "@type" : "Tax",
                                    "sequenceNbr" : "Example String Value",
                                    "taxExcludedInd" : true,
                                    "AmountSummary" : {
                                        "unitPrice" : 100.0000,
                                        "unitName" : "Example String Value",
                                        "quantity" : 3456,
                                        "percentage" : 10,
                                        "description" : "Example String Value",
                                        "Total" : {
                                            "value" : 80000,
                                            "currencyCode" : "USD",
                                            "minorUnit" : 2
                                        },
                                        "ChargeUnit" : {
                                            "value" : "Per order"
                                        }
                                    },
                                    "EffectiveExpire" : {
                                        "value" : null,
                                        "effective" : "2011-01-24",
                                        "expire" : "2011-07-04",
                                        "expireDateExclusiveInd" : true
                                    },
                                    "TaxType_Enum" : {
                                        "value" : "Assessment/license tax"
                                    }
                                } ]
                            },
                            "Fee" : [ {
                                "@type" : "Fee",
                                "taxExcludedInd" : true,
                                "Price" : {
                                    "@type" : "PriceDetail",
                                    "unitPrice" : 100.0000,
                                    "unitName" : "Example String Value",
                                    "quantity" : 4567,
                                    "percentage" : 10,
                                    "description" : "Example String Value",
                                    "maxQuantity" : 1234,
                                    "Total" : {
                                        "value" : 80000,
                                        "currencyCode" : "USD",
                                        "minorUnit" : 2
                                    },
                                    "ChargeUnit" : {
                                        "value" : "Per tray"
                                    }
                                },
                                "FeeType" : {
                                    "value" : "Adult rollaway fee"
                                },
                                "Description" : {
                                    "@type" : "Description",
                                    "name" : "paragraph name",
                                    "number" : 1234,
                                    "Description" : [ {
                                        "value" : "Formatted text example.",
                                        "language" : "en",
                                        "textFormat" : "PlainText"
                                    }, "http://www.OpenTravel.org/ns/OTA2/Common_v01_00", {
                                        "value" : null,
                                        "listItem" : 2345,
                                        "text2" : "Formatted text example.",
                                        "language" : "en",
                                        "textFormat" : "HTML"
                                    } ],
                                    "Image" : [ {
                                        "@type" : "Image",
                                        "objID" : "image_1",
                                        "version" : "Example String Value",
                                        "format" : "2",
                                        "dimensionCategory" : "Example String Value",
                                        "sort" : 2345,
                                        "resolution" : 3456,
                                        "colorSpace" : "Example String Value",
                                        "originalIndicatorInd" : true,
                                        "Identifier" : {
                                            "value" : "guid12345",
                                            "url" : "http://www.OpenTravel.org/ns/OTA2/Common_v01_00",
                                            "system" : "sysABC3344",
                                            "organization" : "Acme"
                                        },
                                        "ImageRef" : "image_1",
                                        "URL" : "http://www.w3.org/2001/XMLSchema",
                                        "Details" : {
                                            "value" : "Example String Value",
                                            "author" : "Example String Value",
                                            "copyrightNotice" : "Example String Value",
                                            "copyrightOwner" : "Example String Value",
                                            "copyrightStart" : "2011-01-24T09:45:00-06:00",
                                            "copyrightEnd" : "2011-07-04T14:15:00+06:00",
                                            "effectiveStart" : "2011-12-05T06:00:00Z",
                                            "effectiveEnd" : "2011-01-24T09:45:00-06:00",
                                            "applicableStart" : "2011-12-05",
                                            "applicableEnd" : "2011-01-24"
                                        },
                                        "MultimediaDescription" : [ {
                                            "@type" : "MultimediaDescription",
                                            "title" : "Example String Value",
                                            "language" : "en",
                                            "caption" : "The Empire State Building at sunset.",
                                            "FormattedTextSubSection" : [ {
                                                "@type" : "FormattedTextSubSection",
                                                "subTitle" : "Example String Value",
                                                "subCode" : "Example String Value",
                                                "subSectionNumber" : 4567,
                                                "TextParagraph" : [ ]
                                            } ]
                                        } ],
                                        "DateTimeStamp" : {
                                            "value" : "2011-07-04T14:15:00+06:00",
                                            "create" : "2011-12-05T06:00:00Z",
                                            "creatorID" : "c123456789",
                                            "lastModify" : "2011-01-24T09:45:00-06:00",
                                            "lastModifierID" : "m987654321",
                                            "purge" : "2011-07-04"
                                        },
                                        "Email" : {
                                            "@type" : "Email",
                                            "remark" : "Example String Value",
                                            "textFormat" : "Example String Value",
                                            "validInd" : true,
                                            "defaultInd" : true,
                                            "Address" : "Example String Value",
                                            "Type" : {
                                                "value" : "Business"
                                            },
                                            "Privacy" : {
                                                "value" : null,
                                                "shareMarketInd" : "Yes",
                                                "shareSyncInd" : "No",
                                                "optInStatus" : "OptedIn",
                                                "optInDate" : "2011-07-04T14:15:00+06:00",
                                                "optOutDate" : "2011-12-05T06:00:00Z"
                                            }
                                        },
                                        "Dimensions" : {
                                            "value" : null,
                                            "unitOfMeasureCode" : "2",
                                            "width" : 1234,
                                            "height" : 2345
                                        },
                                        "File" : {
                                            "value" : null,
                                            "name" : "Example String Value",
                                            "size" : 3456,
                                            "originalName" : "Example String Value"
                                        },
                                        "Geolocation" : {
                                            "value" : null,
                                            "latitude" : "Example String Value",
                                            "longitude" : "Example String Value",
                                            "altitude" : "Example String Value",
                                            "altitudeUnitOfMeasure_Enum" : "Miles",
                                            "mapURL" : "http://www.OpenTravel.org/ns/OTA2/Common_v01_00",
                                            "formatURL" : "http://www.w3.org/2001/XMLSchema"
                                        }
                                    } ],
                                    "DateTimeStamp" : {
                                        "value" : "2011-01-24T09:45:00-06:00",
                                        "create" : "2011-07-04T14:15:00+06:00",
                                        "creatorID" : "c123456789",
                                        "lastModify" : "2011-12-05T06:00:00Z",
                                        "lastModifierID" : "m987654321",
                                        "purge" : "2011-12-05"
                                    }
                                },
                                "FeeDetail" : {
                                    "@type" : "FeeDetailAdditionalPerson",
                                    "minAge" : 3456,
                                    "maxAge" : 4567,
                                    "maxNumberAdditional" : 1234,
                                    "feeAppliesAfter" : 2345
                                }
                            }, {
                                "@type" : "Fee",
                                "taxExcludedInd" : true,
                                "Price" : {
                                    "@type" : "PriceDetail",
                                    "unitPrice" : 100.0000,
                                    "unitName" : "Example String Value",
                                    "quantity" : 3456,
                                    "percentage" : 10,
                                    "description" : "Example String Value",
                                    "maxQuantity" : 4567,
                                    "Total" : {
                                        "value" : 80000,
                                        "currencyCode" : "USD",
                                        "minorUnit" : 2
                                    },
                                    "ChargeUnit" : {
                                        "value" : "Round trip"
                                    }
                                },
                                "FeeType" : {
                                    "value" : "Banquet service fee"
                                },
                                "Description" : {
                                    "@type" : "Description",
                                    "name" : "paragraph name",
                                    "number" : 3456,
                                    "Description" : [ {
                                        "value" : "Formatted text example.",
                                        "language" : "en",
                                        "textFormat" : "PlainText"
                                    }, "http://www.w3.org/2001/XMLSchema", {
                                        "value" : null,
                                        "listItem" : 1234,
                                        "text2" : "Formatted text example.",
                                        "language" : "en",
                                        "textFormat" : "HTML"
                                    } ],
                                    "Image" : [ {
                                        "@type" : "Image",
                                        "objID" : "image_3",
                                        "version" : "Example String Value",
                                        "format" : "2",
                                        "dimensionCategory" : "Example String Value",
                                        "sort" : 4567,
                                        "resolution" : 1234,
                                        "colorSpace" : "Example String Value",
                                        "originalIndicatorInd" : true,
                                        "Identifier" : {
                                            "value" : "guid12345",
                                            "url" : "http://www.w3.org/2001/XMLSchema",
                                            "system" : "sysABC3344",
                                            "organization" : "Acme"
                                        },
                                        "ImageRef" : "image_3",
                                        "URL" : "http://www.OpenTravel.org/ns/OTA2/Common_v01_00",
                                        "Details" : {
                                            "value" : "Example String Value",
                                            "author" : "Example String Value",
                                            "copyrightNotice" : "Example String Value",
                                            "copyrightOwner" : "Example String Value",
                                            "copyrightStart" : "2011-01-24T09:45:00-06:00",
                                            "copyrightEnd" : "2011-07-04T14:15:00+06:00",
                                            "effectiveStart" : "2011-12-05T06:00:00Z",
                                            "effectiveEnd" : "2011-01-24T09:45:00-06:00",
                                            "applicableStart" : "2011-01-24",
                                            "applicableEnd" : "2011-07-04"
                                        },
                                        "MultimediaDescription" : [ {
                                            "@type" : "MultimediaDescription",
                                            "title" : "Example String Value",
                                            "language" : "en",
                                            "caption" : "The Empire State Building at sunset.",
                                            "FormattedTextSubSection" : [ {
                                                "@type" : "FormattedTextSubSection",
                                                "subTitle" : "Example String Value",
                                                "subCode" : "Example String Value",
                                                "subSectionNumber" : 2345,
                                                "TextParagraph" : [ ]
                                            } ]
                                        } ],
                                        "DateTimeStamp" : {
                                            "value" : "2011-07-04T14:15:00+06:00",
                                            "create" : "2011-12-05T06:00:00Z",
                                            "creatorID" : "c123456789",
                                            "lastModify" : "2011-01-24T09:45:00-06:00",
                                            "lastModifierID" : "m987654321",
                                            "purge" : "2011-12-05"
                                        },
                                        "Email" : {
                                            "@type" : "Email",
                                            "remark" : "Example String Value",
                                            "textFormat" : "Example String Value",
                                            "validInd" : true,
                                            "defaultInd" : true,
                                            "Address" : "Example String Value",
                                            "Type" : {
                                                "value" : "Managing company"
                                            },
                                            "Privacy" : {
                                                "value" : null,
                                                "shareMarketInd" : "No",
                                                "shareSyncInd" : "Inherit",
                                                "optInStatus" : "Unknown",
                                                "optInDate" : "2011-07-04T14:15:00+06:00",
                                                "optOutDate" : "2011-12-05T06:00:00Z"
                                            }
                                        },
                                        "Dimensions" : {
                                            "value" : null,
                                            "unitOfMeasureCode" : "2",
                                            "width" : 3456,
                                            "height" : 4567
                                        },
                                        "File" : {
                                            "value" : null,
                                            "name" : "Example String Value",
                                            "size" : 1234,
                                            "originalName" : "Example String Value"
                                        },
                                        "Geolocation" : {
                                            "value" : null,
                                            "latitude" : "Example String Value",
                                            "longitude" : "Example String Value",
                                            "altitude" : "Example String Value",
                                            "altitudeUnitOfMeasure_Enum" : "Meters",
                                            "mapURL" : "http://www.w3.org/2001/XMLSchema",
                                            "formatURL" : "http://www.OpenTravel.org/ns/OTA2/Common_v01_00"
                                        }
                                    } ],
                                    "DateTimeStamp" : {
                                        "value" : "2011-01-24T09:45:00-06:00",
                                        "create" : "2011-07-04T14:15:00+06:00",
                                        "creatorID" : "c123456789",
                                        "lastModify" : "2011-12-05T06:00:00Z",
                                        "lastModifierID" : "m987654321",
                                        "purge" : "2011-01-24"
                                    }
                                },
                                "FeeDetail" : {
                                    "@type" : "FeeDetailAdditionalPerson",
                                    "minAge" : 2345,
                                    "maxAge" : 3456,
                                    "maxNumberAdditional" : 4567,
                                    "feeAppliesAfter" : 1234
                                }
                            } ],
                            "ProductRef" : "product_1",
                            "Gratuity" : {
                                "@type" : "Gratuity",
                                "mandatoryInd" : true,
                                "AmountOrPercent" : {
                                    "@type" : "AmountOrPercentAmount",
                                    "CurrencyAmount" : {
                                        "value" : 80000,
                                        "currencyCode" : "USD",
                                        "minorUnit" : 2
                                    }
                                }
                            },
                            "RoomRate" : {
                                "@type" : "RoomRateDetail",
                                "objID" : "roomRate_1",
                                "effectiveDate" : "2017-08-22",
                                "expireDate" : "2018-08-22",
                                "bookingCode" : "A1KRACKB",
                                "source" : "Promotion",
                                "expireDateExclusiveInd" : true,
                                "Identifier" : {
                                    "value" : "guid12345",
                                    "url" : "http://www.w3.org/2001/XMLSchema",
                                    "system" : "sysABC3344",
                                    "organization" : "Acme"
                                },
                                "RoomRateRef" : "roomRate_1",
                                "Rate" : {
                                    "value" : 12,
                                    "amountBeforeTax" : 23,
                                    "currencyCode" : "USD"
                                },
                                "Taxes" : {
                                    "@type" : "Taxes",
                                    "Total" : {
                                        "value" : 80000,
                                        "currencyCode" : "USD",
                                        "minorUnit" : 2
                                    },
                                    "Tax" : [ {
                                        "@type" : "Tax",
                                        "sequenceNbr" : "Example String Value",
                                        "taxExcludedInd" : true,
                                        "AmountSummary" : {
                                            "unitPrice" : 100.0000,
                                            "unitName" : "Example String Value",
                                            "quantity" : 3456,
                                            "percentage" : 10,
                                            "description" : "Example String Value",
                                            "Total" : {
                                                "value" : 80000,
                                                "currencyCode" : "USD",
                                                "minorUnit" : 2
                                            },
                                            "ChargeUnit" : {
                                                "value" : "Per dozen"
                                            }
                                        },
                                        "EffectiveExpire" : {
                                            "value" : null,
                                            "effective" : "2011-01-24",
                                            "expire" : "2011-07-04",
                                            "expireDateExclusiveInd" : true
                                        },
                                        "TaxType_Enum" : {
                                            "value" : "Bed tax"
                                        }
                                    } ]
                                },
                                "Fees" : {
                                    "@type" : "Fees",
                                    "Fee" : {
                                        "@type" : "Fee",
                                        "taxExcludedInd" : true,
                                        "Price" : {
                                            "@type" : "PriceDetail",
                                            "unitPrice" : 100.0000,
                                            "unitName" : "Example String Value",
                                            "quantity" : 4567,
                                            "percentage" : 10,
                                            "description" : "Example String Value",
                                            "maxQuantity" : 1234,
                                            "Total" : {
                                                "value" : 80000,
                                                "currencyCode" : "USD",
                                                "minorUnit" : 2
                                            },
                                            "ChargeUnit" : {
                                                "value" : "Per gallon"
                                            }
                                        },
                                        "FeeType" : {
                                            "value" : "Application Fee"
                                        },
                                        "Description" : {
                                            "@type" : "Description",
                                            "name" : "paragraph name",
                                            "number" : 4567,
                                            "Description" : [ {
                                                "value" : "Formatted text example.",
                                                "language" : "en",
                                                "textFormat" : "PlainText"
                                            }, "http://www.OpenTravel.org/ns/OTA2/Common_v01_00", {
                                                "value" : null,
                                                "listItem" : 2345,
                                                "text2" : "Formatted text example.",
                                                "language" : "en",
                                                "textFormat" : "HTML"
                                            } ],
                                            "Image" : [ {
                                                "@type" : "Image",
                                                "objID" : "image_2",
                                                "version" : "Example String Value",
                                                "format" : "2",
                                                "dimensionCategory" : "Example String Value",
                                                "sort" : 1234,
                                                "resolution" : 2345,
                                                "colorSpace" : "Example String Value",
                                                "originalIndicatorInd" : true,
                                                "Identifier" : {
                                                    "value" : "guid12345",
                                                    "url" : "http://www.OpenTravel.org/ns/OTA2/Common_v01_00",
                                                    "system" : "sysABC3344",
                                                    "organization" : "Acme"
                                                },
                                                "ImageRef" : "image_2",
                                                "URL" : "http://www.w3.org/2001/XMLSchema",
                                                "Details" : {
                                                    "value" : "Example String Value",
                                                    "author" : "Example String Value",
                                                    "copyrightNotice" : "Example String Value",
                                                    "copyrightOwner" : "Example String Value",
                                                    "copyrightStart" : "2011-01-24T09:45:00-06:00",
                                                    "copyrightEnd" : "2011-07-04T14:15:00+06:00",
                                                    "effectiveStart" : "2011-12-05T06:00:00Z",
                                                    "effectiveEnd" : "2011-01-24T09:45:00-06:00",
                                                    "applicableStart" : "2011-12-05",
                                                    "applicableEnd" : "2011-01-24"
                                                },
                                                "MultimediaDescription" : [ {
                                                    "@type" : "MultimediaDescription",
                                                    "title" : "Example String Value",
                                                    "language" : "en",
                                                    "caption" : "The Empire State Building at sunset.",
                                                    "FormattedTextSubSection" : [ {
                                                        "@type" : "FormattedTextSubSection",
                                                        "subTitle" : "Example String Value",
                                                        "subCode" : "Example String Value",
                                                        "subSectionNumber" : 3456,
                                                        "TextParagraph" : [ ]
                                                    } ]
                                                } ],
                                                "DateTimeStamp" : {
                                                    "value" : "2011-07-04T14:15:00+06:00",
                                                    "create" : "2011-12-05T06:00:00Z",
                                                    "creatorID" : "c123456789",
                                                    "lastModify" : "2011-01-24T09:45:00-06:00",
                                                    "lastModifierID" : "m987654321",
                                                    "purge" : "2011-07-04"
                                                },
                                                "Email" : {
                                                    "@type" : "Email",
                                                    "remark" : "Example String Value",
                                                    "textFormat" : "Example String Value",
                                                    "validInd" : true,
                                                    "defaultInd" : true,
                                                    "Address" : "Example String Value",
                                                    "Type" : {
                                                        "value" : "Listserve"
                                                    },
                                                    "Privacy" : {
                                                        "value" : null,
                                                        "shareMarketInd" : "Inherit",
                                                        "shareSyncInd" : "Yes",
                                                        "optInStatus" : "OptedOut",
                                                        "optInDate" : "2011-07-04T14:15:00+06:00",
                                                        "optOutDate" : "2011-12-05T06:00:00Z"
                                                    }
                                                },
                                                "Dimensions" : {
                                                    "value" : null,
                                                    "unitOfMeasureCode" : "2",
                                                    "width" : 4567,
                                                    "height" : 1234
                                                },
                                                "File" : {
                                                    "value" : null,
                                                    "name" : "Example String Value",
                                                    "size" : 2345,
                                                    "originalName" : "Example String Value"
                                                },
                                                "Geolocation" : {
                                                    "value" : null,
                                                    "latitude" : "Example String Value",
                                                    "longitude" : "Example String Value",
                                                    "altitude" : "Example String Value",
                                                    "altitudeUnitOfMeasure_Enum" : "Kilometers",
                                                    "mapURL" : "http://www.OpenTravel.org/ns/OTA2/Common_v01_00",
                                                    "formatURL" : "http://www.w3.org/2001/XMLSchema"
                                                }
                                            } ],
                                            "DateTimeStamp" : {
                                                "value" : "2011-01-24T09:45:00-06:00",
                                                "create" : "2011-07-04T14:15:00+06:00",
                                                "creatorID" : "c123456789",
                                                "lastModify" : "2011-12-05T06:00:00Z",
                                                "lastModifierID" : "m987654321",
                                                "purge" : "2011-12-05"
                                            }
                                        },
                                        "FeeDetail" : {
                                            "@type" : "FeeDetailAdditionalPerson",
                                            "minAge" : 3456,
                                            "maxAge" : 4567,
                                            "maxNumberAdditional" : 1234,
                                            "feeAppliesAfter" : 2345
                                        }
                                    },
                                    "Total" : {
                                        "value" : 80000,
                                        "currencyCode" : "USD",
                                        "minorUnit" : 2
                                    }
                                }
                            }
                        } ],
                        "PriceModifiers" : [ {
                            "@type" : "PriceModifiers",
                            "Promotion" : [ {
                                "value" : "Example String Value",
                                "promotionVendorCode" : [ "Example", "String", "Value", "Example", "String", "Value", "Example", "String", "Value" ],
                                "code" : "Example String Value",
                                "name" : "Example String Value"
                            } ],
                            "RateQualifier" : [ {
                                "value" : "Example String Value",
                                "code" : "Example String Value",
                                "rateAuthorizationCode" : "Example String Value",
                                "rateID" : "Example String Value",
                                "ratePeriod" : "Hourly",
                                "description" : "Example String Value"
                            } ],
                            "PersonIdentifier" : [ {
                                "objID" : "person_1",
                                "Identifier" : {
                                    "value" : "guid12345",
                                    "url" : "http://www.w3.org/2001/XMLSchema",
                                    "system" : "sysABC3344",
                                    "organization" : "Acme"
                                },
                                "OtherID" : [ {
                                    "value" : "guid12345",
                                    "url" : "http://www.OpenTravel.org/ns/OTA2/Common_v01_00",
                                    "system" : "sysABC3344",
                                    "organization" : "Acme"
                                } ],
                                "PersonRef" : "person_1"
                            } ],
                            "ProductRef" : "product_2"
                        } ],
                        "Taxes" : {
                            "@type" : "Taxes",
                            "Total" : {
                                "value" : 80000,
                                "currencyCode" : "USD",
                                "minorUnit" : 2
                            },
                            "Tax" : [ {
                                "@type" : "Tax",
                                "sequenceNbr" : "Example String Value",
                                "taxExcludedInd" : true,
                                "AmountSummary" : {
                                    "unitPrice" : 100.0000,
                                    "unitName" : "Example String Value",
                                    "quantity" : 2345,
                                    "percentage" : 10,
                                    "description" : "Example String Value",
                                    "Total" : {
                                        "value" : 80000,
                                        "currencyCode" : "USD",
                                        "minorUnit" : 2
                                    },
                                    "ChargeUnit" : {
                                        "value" : "Per room"
                                    }
                                },
                                "EffectiveExpire" : {
                                    "value" : null,
                                    "effective" : "2011-07-04",
                                    "expire" : "2011-12-05",
                                    "expireDateExclusiveInd" : true
                                },
                                "TaxType_Enum" : {
                                    "value" : "City tax"
                                }
                            } ]
                        }
                    },
                    "TermsAndConditions" : [ {
                        "@type" : "TermsAndConditions",
                        "objID" : "termsAndConditions_1",
                        "duration" : 2345,
                        "Identifier" : {
                            "value" : "guid12345",
                            "url" : "http://www.OpenTravel.org/ns/OTA2/Common_v01_00",
                            "system" : "sysABC3344",
                            "organization" : "Acme"
                        },
                        "TermsAndConditionsRef" : "termsAndConditions_1",
                        "Promotion" : {
                            "value" : "Example String Value",
                            "promotionVendorCode" : [ "Example", "String", "Value", "Example", "String", "Value", "Example", "String", "Value" ],
                            "code" : "Example String Value",
                            "name" : "Example String Value"
                        },
                        "RebateProgram" : [ {
                            "@type" : "RebateProgram",
                            "programName" : "Example String Value",
                            "participationInd" : true,
                            "PaymentCardSummary" : [ {
                                "id" : "paymentCard_1",
                                "effectiveDate" : "0116",
                                "expireDate" : "0117",
                                "secureInd" : true,
                                "Privacy" : {
                                    "value" : null,
                                    "shareMarketInd" : "Yes",
                                    "shareSyncInd" : "No",
                                    "optInStatus" : "OptedIn",
                                    "optInDate" : "2011-01-24T09:45:00-06:00",
                                    "optOutDate" : "2011-07-04T14:15:00+06:00"
                                },
                                "CardCode" : "AX",
                                "CardType" : {
                                    "value" : "786",
                                    "issuerCode" : "VISA",
                                    "issuerCodeExtension" : "issuerCode_Other_Value"
                                },
                                "Issuer" : {
                                    "value" : "Example String Value",
                                    "description" : "Visa",
                                    "name" : "Example String Value",
                                    "uRL" : "http://www.w3.org/2001/XMLSchema",
                                    "id" : "codeExternal_1"
                                },
                                "CardHolderName" : "Example String Value",
                                "CardNumber" : {
                                    "@type" : "CardNumber",
                                    "encryptionKey" : "KHC32198gt4",
                                    "encryptionKeyMethod" : "RotatingKeyEnvironment_DailyKey",
                                    "encryptionMethod" : "Triple DES",
                                    "encryptedValue" : "5dfc52b51bd35553df8592078de921bc",
                                    "mask" : "xxxxxxxxxxxx9922",
                                    "token" : "AEGHV234AUD54367",
                                    "tokenProviderID" : "Shift4 (payment)",
                                    "authenticationMethod" : "SecurityCode",
                                    "PlainText" : "Example String Value",
                                    "Warning" : {
                                        "value" : "Example String Value",
                                        "language" : "en",
                                        "type" : "Advisory",
                                        "typeExtension" : "type_Other_Value",
                                        "shortText" : "Example String Value",
                                        "code" : "2",
                                        "docURL" : "http://www.OpenTravel.org/ns/OTA2/Common_v01_00",
                                        "tag" : "Example String Value",
                                        "recordID" : "Example String Value",
                                        "nodeList" : "Example String Value",
                                        "status" : "Complete",
                                        "statusExtension" : "status_Other_Value"
                                    }
                                },
                                "AuthenticationVerification" : {
                                    "@type" : "AuthenticationVerification",
                                    "encryptionKey" : "KHC32198gt4",
                                    "encryptionKeyMethod" : "RotatingKeyEnvironment_DailyKey",
                                    "encryptionMethod" : "Triple DES",
                                    "encryptedValue" : "5dfc52b51bd35553df8592078de921bc",
                                    "mask" : "xxxxxxxxxxxx9922",
                                    "token" : "AEGHV234AUD54367",
                                    "tokenProviderID" : "Shift4 (payment)",
                                    "authenticationMethod" : "MagneticStripe",
                                    "PlainText" : "Example String Value",
                                    "Warning" : {
                                        "value" : "Example String Value",
                                        "language" : "en",
                                        "type" : "Application error",
                                        "typeExtension" : "type_Other_Value",
                                        "shortText" : "Example String Value",
                                        "code" : "2",
                                        "docURL" : "http://www.w3.org/2001/XMLSchema",
                                        "tag" : "Example String Value",
                                        "recordID" : "Example String Value",
                                        "nodeList" : "Example String Value",
                                        "status" : "Incomplete",
                                        "statusExtension" : "status_Other_Value"
                                    }
                                },
                                "MagneticStripe" : [ {
                                    "@type" : "MagneticStripe",
                                    "encryptionKey" : "KHC32198gt4",
                                    "encryptionKeyMethod" : "RotatingKeyEnvironment_DailyKey",
                                    "encryptionMethod" : "Triple DES",
                                    "encryptedValue" : "5dfc52b51bd35553df8592078de921bc",
                                    "mask" : "xxxxxxxxxxxx9922",
                                    "token" : "AEGHV234AUD54367",
                                    "tokenProviderID" : "Shift4 (payment)",
                                    "authenticationMethod" : "SecurityCode",
                                    "PlainText" : "Example String Value",
                                    "Warning" : {
                                        "value" : "Example String Value",
                                        "language" : "en",
                                        "type" : "Authentication",
                                        "typeExtension" : "type_Other_Value",
                                        "shortText" : "Example String Value",
                                        "code" : "2",
                                        "docURL" : "http://www.OpenTravel.org/ns/OTA2/Common_v01_00",
                                        "tag" : "Example String Value",
                                        "recordID" : "Example String Value",
                                        "nodeList" : "Example String Value",
                                        "status" : "Not processed",
                                        "statusExtension" : "status_Other_Value"
                                    }
                                } ],
                                "SeriesCode" : {
                                    "@type" : "SeriesCode",
                                    "encryptionKey" : "KHC32198gt4",
                                    "encryptionKeyMethod" : "RotatingKeyEnvironment_DailyKey",
                                    "encryptionMethod" : "Triple DES",
                                    "encryptedValue" : "5dfc52b51bd35553df8592078de921bc",
                                    "mask" : "xxxxxxxxxxxx9922",
                                    "token" : "AEGHV234AUD54367",
                                    "tokenProviderID" : "Shift4 (payment)",
                                    "authenticationMethod" : "MagneticStripe",
                                    "PlainText" : "Example String Value",
                                    "Warning" : {
                                        "value" : "Example String Value",
                                        "language" : "en",
                                        "type" : "Authentication timeout",
                                        "typeExtension" : "type_Other_Value",
                                        "shortText" : "Example String Value",
                                        "code" : "2",
                                        "docURL" : "http://www.w3.org/2001/XMLSchema",
                                        "tag" : "Example String Value",
                                        "recordID" : "Example String Value",
                                        "nodeList" : "Example String Value",
                                        "status" : "Unknown",
                                        "statusExtension" : "status_Other_Value"
                                    }
                                }
                            } ],
                            "ProgramRestrictions" : {
                                "value" : "Some fee text.",
                                "language" : "en"
                            }
                        } ],
                        "Description" : {
                            "@type" : "Description",
                            "name" : "paragraph name",
                            "number" : 3456,
                            "Description" : [ {
                                "value" : "Formatted text example.",
                                "language" : "en",
                                "textFormat" : "PlainText"
                            }, "http://www.OpenTravel.org/ns/OTA2/Common_v01_00", {
                                "value" : null,
                                "listItem" : 3456,
                                "text2" : "Formatted text example.",
                                "language" : "en",
                                "textFormat" : "HTML"
                            } ],
                            "Image" : [ {
                                "@type" : "Image",
                                "objID" : "image_4",
                                "version" : "Example String Value",
                                "format" : "2",
                                "dimensionCategory" : "Example String Value",
                                "sort" : 4567,
                                "resolution" : 1234,
                                "colorSpace" : "Example String Value",
                                "originalIndicatorInd" : true,
                                "Identifier" : {
                                    "value" : "guid12345",
                                    "url" : "http://www.OpenTravel.org/ns/OTA2/Common_v01_00",
                                    "system" : "sysABC3344",
                                    "organization" : "Acme"
                                },
                                "ImageRef" : "image_4",
                                "URL" : "http://www.w3.org/2001/XMLSchema",
                                "Details" : {
                                    "value" : "Example String Value",
                                    "author" : "Example String Value",
                                    "copyrightNotice" : "Example String Value",
                                    "copyrightOwner" : "Example String Value",
                                    "copyrightStart" : "2011-12-05T06:00:00Z",
                                    "copyrightEnd" : "2011-01-24T09:45:00-06:00",
                                    "effectiveStart" : "2011-07-04T14:15:00+06:00",
                                    "effectiveEnd" : "2011-12-05T06:00:00Z",
                                    "applicableStart" : "2011-01-24",
                                    "applicableEnd" : "2011-07-04"
                                },
                                "MultimediaDescription" : [ {
                                    "@type" : "MultimediaDescription",
                                    "title" : "Example String Value",
                                    "language" : "en",
                                    "caption" : "The Empire State Building at sunset.",
                                    "FormattedTextSubSection" : [ {
                                        "@type" : "FormattedTextSubSection",
                                        "subTitle" : "Example String Value",
                                        "subCode" : "Example String Value",
                                        "subSectionNumber" : 2345,
                                        "TextParagraph" : [ ]
                                    } ]
                                } ],
                                "DateTimeStamp" : {
                                    "value" : "2011-01-24T09:45:00-06:00",
                                    "create" : "2011-07-04T14:15:00+06:00",
                                    "creatorID" : "c123456789",
                                    "lastModify" : "2011-12-05T06:00:00Z",
                                    "lastModifierID" : "m987654321",
                                    "purge" : "2011-12-05"
                                },
                                "Email" : {
                                    "@type" : "Email",
                                    "remark" : "Example String Value",
                                    "textFormat" : "Example String Value",
                                    "validInd" : true,
                                    "defaultInd" : true,
                                    "Address" : "Example String Value",
                                    "Type" : {
                                        "value" : "Personal"
                                    },
                                    "Privacy" : {
                                        "value" : null,
                                        "shareMarketInd" : "Inherit",
                                        "shareSyncInd" : "Yes",
                                        "optInStatus" : "OptedOut",
                                        "optInDate" : "2011-01-24T09:45:00-06:00",
                                        "optOutDate" : "2011-07-04T14:15:00+06:00"
                                    }
                                },
                                "Dimensions" : {
                                    "value" : null,
                                    "unitOfMeasureCode" : "2",
                                    "width" : 3456,
                                    "height" : 4567
                                },
                                "File" : {
                                    "value" : null,
                                    "name" : "Example String Value",
                                    "size" : 1234,
                                    "originalName" : "Example String Value"
                                },
                                "Geolocation" : {
                                    "value" : null,
                                    "latitude" : "Example String Value",
                                    "longitude" : "Example String Value",
                                    "altitude" : "Example String Value",
                                    "altitudeUnitOfMeasure_Enum" : "Millimeters",
                                    "mapURL" : "http://www.OpenTravel.org/ns/OTA2/Common_v01_00",
                                    "formatURL" : "http://www.w3.org/2001/XMLSchema"
                                }
                            } ],
                            "DateTimeStamp" : {
                                "value" : "2011-12-05T06:00:00Z",
                                "create" : "2011-01-24T09:45:00-06:00",
                                "creatorID" : "c123456789",
                                "lastModify" : "2011-07-04T14:15:00+06:00",
                                "lastModifierID" : "m987654321",
                                "purge" : "2011-01-24"
                            }
                        },
                        "CancelPenalty" : [ {
                            "@type" : "CancelPenaltyDetail",
                            "numberOfNights" : 4567,
                            "policyId" : "Example String Value",
                            "nonRefundableInd" : true,
                            "noCancelInd" : true,
                            "BasisType" : {
                                "value" : "Days"
                            },
                            "Deadline" : {
                                "@type" : "DeadlineTimePeriod",
                                "deadlineType" : "BeforeArrival",
                                "minPeriod" : 1234,
                                "maxPeriod" : 2345,
                                "timePeriod" : "Example String Value"
                            },
                            "AmountPercent" : {
                                "value" : null,
                                "amount" : 5000,
                                "percent" : 5,
                                "currencyCode" : "USD",
                                "decimalPlaces" : "2"
                            },
                            "Description" : [ {
                                "@type" : "Description",
                                "name" : "paragraph name",
                                "number" : 2345,
                                "Description" : [ {
                                    "value" : "Formatted text example.",
                                    "language" : "en",
                                    "textFormat" : "PlainText"
                                }, "http://www.w3.org/2001/XMLSchema", {
                                    "value" : null,
                                    "listItem" : 3456,
                                    "text2" : "Formatted text example.",
                                    "language" : "en",
                                    "textFormat" : "HTML"
                                } ],
                                "Image" : [ {
                                    "@type" : "Image",
                                    "objID" : "image_5",
                                    "version" : "Example String Value",
                                    "format" : "2",
                                    "dimensionCategory" : "Example String Value",
                                    "sort" : 3456,
                                    "resolution" : 4567,
                                    "colorSpace" : "Example String Value",
                                    "originalIndicatorInd" : true,
                                    "Identifier" : {
                                        "value" : "guid12345",
                                        "url" : "http://www.w3.org/2001/XMLSchema",
                                        "system" : "sysABC3344",
                                        "organization" : "Acme"
                                    },
                                    "ImageRef" : "image_5",
                                    "URL" : "http://www.OpenTravel.org/ns/OTA2/Common_v01_00",
                                    "Details" : {
                                        "value" : "Example String Value",
                                        "author" : "Example String Value",
                                        "copyrightNotice" : "Example String Value",
                                        "copyrightOwner" : "Example String Value",
                                        "copyrightStart" : "2011-12-05T06:00:00Z",
                                        "copyrightEnd" : "2011-01-24T09:45:00-06:00",
                                        "effectiveStart" : "2011-07-04T14:15:00+06:00",
                                        "effectiveEnd" : "2011-12-05T06:00:00Z",
                                        "applicableStart" : "2011-07-04",
                                        "applicableEnd" : "2011-12-05"
                                    },
                                    "MultimediaDescription" : [ {
                                        "@type" : "MultimediaDescription",
                                        "title" : "Example String Value",
                                        "language" : "en",
                                        "caption" : "The Empire State Building at sunset.",
                                        "FormattedTextSubSection" : [ {
                                            "@type" : "FormattedTextSubSection",
                                            "subTitle" : "Example String Value",
                                            "subCode" : "Example String Value",
                                            "subSectionNumber" : 1234,
                                            "TextParagraph" : [ ]
                                        } ]
                                    } ],
                                    "DateTimeStamp" : {
                                        "value" : "2011-01-24T09:45:00-06:00",
                                        "create" : "2011-07-04T14:15:00+06:00",
                                        "creatorID" : "c123456789",
                                        "lastModify" : "2011-12-05T06:00:00Z",
                                        "lastModifierID" : "m987654321",
                                        "purge" : "2011-01-24"
                                    },
                                    "Email" : {
                                        "@type" : "Email",
                                        "remark" : "Example String Value",
                                        "textFormat" : "Example String Value",
                                        "validInd" : true,
                                        "defaultInd" : true,
                                        "Address" : "Example String Value",
                                        "Type" : {
                                            "value" : "Property"
                                        },
                                        "Privacy" : {
                                            "value" : null,
                                            "shareMarketInd" : "No",
                                            "shareSyncInd" : "Inherit",
                                            "optInStatus" : "Unknown",
                                            "optInDate" : "2011-01-24T09:45:00-06:00",
                                            "optOutDate" : "2011-07-04T14:15:00+06:00"
                                        }
                                    },
                                    "Dimensions" : {
                                        "value" : null,
                                        "unitOfMeasureCode" : "2",
                                        "width" : 2345,
                                        "height" : 3456
                                    },
                                    "File" : {
                                        "value" : null,
                                        "name" : "Example String Value",
                                        "size" : 4567,
                                        "originalName" : "Example String Value"
                                    },
                                    "Geolocation" : {
                                        "value" : null,
                                        "latitude" : "Example String Value",
                                        "longitude" : "Example String Value",
                                        "altitude" : "Example String Value",
                                        "altitudeUnitOfMeasure_Enum" : "Centimeters",
                                        "mapURL" : "http://www.w3.org/2001/XMLSchema",
                                        "formatURL" : "http://www.OpenTravel.org/ns/OTA2/Common_v01_00"
                                    }
                                } ],
                                "DateTimeStamp" : {
                                    "value" : "2011-12-05T06:00:00Z",
                                    "create" : "2011-01-24T09:45:00-06:00",
                                    "creatorID" : "c123456789",
                                    "lastModify" : "2011-07-04T14:15:00+06:00",
                                    "lastModifierID" : "m987654321",
                                    "purge" : "2011-07-04"
                                }
                            } ]
                        } ],
                        "GuaranteePolicy" : {
                            "@type" : "GuaranteePolicy",
                            "retribution" : "ResAutoCancelled",
                            "code" : "Example String Value",
                            "type" : "GuaranteeRequired",
                            "guaranteePolicyType" : "CC/DC/Voucher",
                            "Deadline" : {
                                "@type" : "DeadlineTimePeriod",
                                "deadlineType" : "AfterBooking",
                                "minPeriod" : 4567,
                                "maxPeriod" : 1234,
                                "timePeriod" : "Example String Value"
                            },
                            "Comment" : [ {
                                "@type" : "Comment",
                                "name" : "paragraph name",
                                "number" : 1234,
                                "Comment" : [ {
                                    "value" : "Formatted text example.",
                                    "language" : "en",
                                    "textFormat" : "PlainText"
                                }, "http://www.OpenTravel.org/ns/OTA2/Common_v01_00", {
                                    "value" : null,
                                    "listItem" : 2345,
                                    "text2" : "Formatted text example.",
                                    "language" : "en",
                                    "textFormat" : "HTML"
                                } ],
                                "Image" : [ {
                                    "@type" : "Image",
                                    "objID" : "image_6",
                                    "version" : "Example String Value",
                                    "format" : "2",
                                    "dimensionCategory" : "Example String Value",
                                    "sort" : 2345,
                                    "resolution" : 3456,
                                    "colorSpace" : "Example String Value",
                                    "originalIndicatorInd" : true,
                                    "Identifier" : {
                                        "value" : "guid12345",
                                        "url" : "http://www.OpenTravel.org/ns/OTA2/Common_v01_00",
                                        "system" : "sysABC3344",
                                        "organization" : "Acme"
                                    },
                                    "ImageRef" : "image_6",
                                    "URL" : "http://www.w3.org/2001/XMLSchema",
                                    "Details" : {
                                        "value" : "Example String Value",
                                        "author" : "Example String Value",
                                        "copyrightNotice" : "Example String Value",
                                        "copyrightOwner" : "Example String Value",
                                        "copyrightStart" : "2011-12-05T06:00:00Z",
                                        "copyrightEnd" : "2011-01-24T09:45:00-06:00",
                                        "effectiveStart" : "2011-07-04T14:15:00+06:00",
                                        "effectiveEnd" : "2011-12-05T06:00:00Z",
                                        "applicableStart" : "2011-12-05",
                                        "applicableEnd" : "2011-01-24"
                                    },
                                    "MultimediaDescription" : [ {
                                        "@type" : "MultimediaDescription",
                                        "title" : "Example String Value",
                                        "language" : "en",
                                        "caption" : "The Empire State Building at sunset.",
                                        "FormattedTextSubSection" : [ {
                                            "@type" : "FormattedTextSubSection",
                                            "subTitle" : "Example String Value",
                                            "subCode" : "Example String Value",
                                            "subSectionNumber" : 4567,
                                            "TextParagraph" : [ ]
                                        } ]
                                    } ],
                                    "DateTimeStamp" : {
                                        "value" : "2011-01-24T09:45:00-06:00",
                                        "create" : "2011-07-04T14:15:00+06:00",
                                        "creatorID" : "c123456789",
                                        "lastModify" : "2011-12-05T06:00:00Z",
                                        "lastModifierID" : "m987654321",
                                        "purge" : "2011-07-04"
                                    },
                                    "Email" : {
                                        "@type" : "Email",
                                        "remark" : "Example String Value",
                                        "textFormat" : "Example String Value",
                                        "validInd" : true,
                                        "defaultInd" : true,
                                        "Address" : "Example String Value",
                                        "Type" : {
                                            "value" : "Reservation office"
                                        },
                                        "Privacy" : {
                                            "value" : null,
                                            "shareMarketInd" : "Yes",
                                            "shareSyncInd" : "No",
                                            "optInStatus" : "OptedIn",
                                            "optInDate" : "2011-01-24T09:45:00-06:00",
                                            "optOutDate" : "2011-07-04T14:15:00+06:00"
                                        }
                                    },
                                    "Dimensions" : {
                                        "value" : null,
                                        "unitOfMeasureCode" : "2",
                                        "width" : 1234,
                                        "height" : 2345
                                    },
                                    "File" : {
                                        "value" : null,
                                        "name" : "Example String Value",
                                        "size" : 3456,
                                        "originalName" : "Example String Value"
                                    },
                                    "Geolocation" : {
                                        "value" : null,
                                        "latitude" : "Example String Value",
                                        "longitude" : "Example String Value",
                                        "altitude" : "Example String Value",
                                        "altitudeUnitOfMeasure_Enum" : "Yards",
                                        "mapURL" : "http://www.OpenTravel.org/ns/OTA2/Common_v01_00",
                                        "formatURL" : "http://www.w3.org/2001/XMLSchema"
                                    }
                                } ],
                                "DateTimeStamp" : {
                                    "value" : "2011-12-05T06:00:00Z",
                                    "create" : "2011-01-24T09:45:00-06:00",
                                    "creatorID" : "c123456789",
                                    "lastModify" : "2011-07-04T14:15:00+06:00",
                                    "lastModifierID" : "m987654321",
                                    "purge" : "2011-12-05"
                                }
                            } ],
                            "Description" : [ {
                                "@type" : "Description",
                                "name" : "paragraph name",
                                "number" : 4567,
                                "Description" : [ {
                                    "value" : "Formatted text example.",
                                    "language" : "en",
                                    "textFormat" : "PlainText"
                                }, "http://www.w3.org/2001/XMLSchema", {
                                    "value" : null,
                                    "listItem" : 3456,
                                    "text2" : "Formatted text example.",
                                    "language" : "en",
                                    "textFormat" : "HTML"
                                } ],
                                "Image" : [ {
                                    "@type" : "Image",
                                    "objID" : "image_7",
                                    "version" : "Example String Value",
                                    "format" : "2",
                                    "dimensionCategory" : "Example String Value",
                                    "sort" : 1234,
                                    "resolution" : 2345,
                                    "colorSpace" : "Example String Value",
                                    "originalIndicatorInd" : true,
                                    "Identifier" : {
                                        "value" : "guid12345",
                                        "url" : "http://www.w3.org/2001/XMLSchema",
                                        "system" : "sysABC3344",
                                        "organization" : "Acme"
                                    },
                                    "ImageRef" : "image_7",
                                    "URL" : "http://www.OpenTravel.org/ns/OTA2/Common_v01_00",
                                    "Details" : {
                                        "value" : "Example String Value",
                                        "author" : "Example String Value",
                                        "copyrightNotice" : "Example String Value",
                                        "copyrightOwner" : "Example String Value",
                                        "copyrightStart" : "2011-12-05T06:00:00Z",
                                        "copyrightEnd" : "2011-01-24T09:45:00-06:00",
                                        "effectiveStart" : "2011-07-04T14:15:00+06:00",
                                        "effectiveEnd" : "2011-12-05T06:00:00Z",
                                        "applicableStart" : "2011-01-24",
                                        "applicableEnd" : "2011-07-04"
                                    },
                                    "MultimediaDescription" : [ {
                                        "@type" : "MultimediaDescription",
                                        "title" : "Example String Value",
                                        "language" : "en",
                                        "caption" : "The Empire State Building at sunset.",
                                        "FormattedTextSubSection" : [ {
                                            "@type" : "FormattedTextSubSection",
                                            "subTitle" : "Example String Value",
                                            "subCode" : "Example String Value",
                                            "subSectionNumber" : 3456,
                                            "TextParagraph" : [ ]
                                        } ]
                                    } ],
                                    "DateTimeStamp" : {
                                        "value" : "2011-01-24T09:45:00-06:00",
                                        "create" : "2011-07-04T14:15:00+06:00",
                                        "creatorID" : "c123456789",
                                        "lastModify" : "2011-12-05T06:00:00Z",
                                        "lastModifierID" : "m987654321",
                                        "purge" : "2011-12-05"
                                    },
                                    "Email" : {
                                        "@type" : "Email",
                                        "remark" : "Example String Value",
                                        "textFormat" : "Example String Value",
                                        "validInd" : true,
                                        "defaultInd" : true,
                                        "Address" : "Example String Value",
                                        "Type" : {
                                            "value" : "Sales office"
                                        },
                                        "Privacy" : {
                                            "value" : null,
                                            "shareMarketInd" : "Inherit",
                                            "shareSyncInd" : "Yes",
                                            "optInStatus" : "OptedOut",
                                            "optInDate" : "2011-01-24T09:45:00-06:00",
                                            "optOutDate" : "2011-07-04T14:15:00+06:00"
                                        }
                                    },
                                    "Dimensions" : {
                                        "value" : null,
                                        "unitOfMeasureCode" : "2",
                                        "width" : 4567,
                                        "height" : 1234
                                    },
                                    "File" : {
                                        "value" : null,
                                        "name" : "Example String Value",
                                        "size" : 2345,
                                        "originalName" : "Example String Value"
                                    },
                                    "Geolocation" : {
                                        "value" : null,
                                        "latitude" : "Example String Value",
                                        "longitude" : "Example String Value",
                                        "altitude" : "Example String Value",
                                        "altitudeUnitOfMeasure_Enum" : "Feet",
                                        "mapURL" : "http://www.w3.org/2001/XMLSchema",
                                        "formatURL" : "http://www.OpenTravel.org/ns/OTA2/Common_v01_00"
                                    }
                                } ],
                                "DateTimeStamp" : {
                                    "value" : "2011-12-05T06:00:00Z",
                                    "create" : "2011-01-24T09:45:00-06:00",
                                    "creatorID" : "c123456789",
                                    "lastModify" : "2011-07-04T14:15:00+06:00",
                                    "lastModifierID" : "m987654321",
                                    "purge" : "2011-01-24"
                                }
                            } ],
                            "CurrencyCode" : {
                                "value" : "USD",
                                "decimalPlaces" : "2"
                            },
                            "GuaranteesAccepted" : [ {
                                "@type" : "GuaranteesAccepted",
                                "noCardHolderInfoReqInd" : true,
                                "nameReqInd" : true,
                                "addressReqInd" : true,
                                "phoneReqInd" : true,
                                "interbankNbrReqInd" : true,
                                "bookingSourceAllowedInd" : true,
                                "corpDiscountNbrAllowedInd" : true,
                                "Type" : [ {
                                    "value" : "Air travel card"
                                }, {
                                    "value" : "Air travel card"
                                } ],
                                "PaymentCardCode" : [ {
                                    "value" : "VI"
                                }, {
                                    "value" : "VI"
                                } ]
                            } ],
                            "DepositPolicy" : [ {
                                "@type" : "DepositPolicy",
                                "numberOfNights" : 4567,
                                "BasisType" : {
                                    "value" : "Entire"
                                },
                                "AmountPercent" : {
                                    "value" : null,
                                    "amount" : 5000,
                                    "percent" : 5,
                                    "currencyCode" : "USD",
                                    "decimalPlaces" : "2"
                                },
                                "Deadline" : {
                                    "@type" : "DeadlineTimePeriod",
                                    "deadlineType" : "AfterConfirmation",
                                    "minPeriod" : 1234,
                                    "maxPeriod" : 2345,
                                    "timePeriod" : "Example String Value"
                                },
                                "Description" : {
                                    "@type" : "Description",
                                    "name" : "paragraph name",
                                    "number" : 3456,
                                    "Description" : [ {
                                        "value" : "Formatted text example.",
                                        "language" : "en",
                                        "textFormat" : "PlainText"
                                    }, "http://www.OpenTravel.org/ns/OTA2/Common_v01_00", {
                                        "value" : null,
                                        "listItem" : 3456,
                                        "text2" : "Formatted text example.",
                                        "language" : "en",
                                        "textFormat" : "HTML"
                                    } ],
                                    "Image" : [ {
                                        "@type" : "Image",
                                        "objID" : "image_8",
                                        "version" : "Example String Value",
                                        "format" : "2",
                                        "dimensionCategory" : "Example String Value",
                                        "sort" : 4567,
                                        "resolution" : 1234,
                                        "colorSpace" : "Example String Value",
                                        "originalIndicatorInd" : true,
                                        "Identifier" : {
                                            "value" : "guid12345",
                                            "url" : "http://www.OpenTravel.org/ns/OTA2/Common_v01_00",
                                            "system" : "sysABC3344",
                                            "organization" : "Acme"
                                        },
                                        "ImageRef" : "image_8",
                                        "URL" : "http://www.w3.org/2001/XMLSchema",
                                        "Details" : {
                                            "value" : "Example String Value",
                                            "author" : "Example String Value",
                                            "copyrightNotice" : "Example String Value",
                                            "copyrightOwner" : "Example String Value",
                                            "copyrightStart" : "2011-12-05T06:00:00Z",
                                            "copyrightEnd" : "2011-01-24T09:45:00-06:00",
                                            "effectiveStart" : "2011-07-04T14:15:00+06:00",
                                            "effectiveEnd" : "2011-12-05T06:00:00Z",
                                            "applicableStart" : "2011-07-04",
                                            "applicableEnd" : "2011-12-05"
                                        },
                                        "MultimediaDescription" : [ {
                                            "@type" : "MultimediaDescription",
                                            "title" : "Example String Value",
                                            "language" : "en",
                                            "caption" : "The Empire State Building at sunset.",
                                            "FormattedTextSubSection" : [ {
                                                "@type" : "FormattedTextSubSection",
                                                "subTitle" : "Example String Value",
                                                "subCode" : "Example String Value",
                                                "subSectionNumber" : 2345,
                                                "TextParagraph" : [ ]
                                            } ]
                                        } ],
                                        "DateTimeStamp" : {
                                            "value" : "2011-01-24T09:45:00-06:00",
                                            "create" : "2011-07-04T14:15:00+06:00",
                                            "creatorID" : "c123456789",
                                            "lastModify" : "2011-12-05T06:00:00Z",
                                            "lastModifierID" : "m987654321",
                                            "purge" : "2011-01-24"
                                        },
                                        "Email" : {
                                            "@type" : "Email",
                                            "remark" : "Example String Value",
                                            "textFormat" : "Example String Value",
                                            "validInd" : true,
                                            "defaultInd" : true,
                                            "Address" : "Example String Value",
                                            "Type" : {
                                                "value" : "Business"
                                            },
                                            "Privacy" : {
                                                "value" : null,
                                                "shareMarketInd" : "No",
                                                "shareSyncInd" : "Inherit",
                                                "optInStatus" : "Unknown",
                                                "optInDate" : "2011-01-24T09:45:00-06:00",
                                                "optOutDate" : "2011-07-04T14:15:00+06:00"
                                            }
                                        },
                                        "Dimensions" : {
                                            "value" : null,
                                            "unitOfMeasureCode" : "2",
                                            "width" : 3456,
                                            "height" : 4567
                                        },
                                        "File" : {
                                            "value" : null,
                                            "name" : "Example String Value",
                                            "size" : 1234,
                                            "originalName" : "Example String Value"
                                        },
                                        "Geolocation" : {
                                            "value" : null,
                                            "latitude" : "Example String Value",
                                            "longitude" : "Example String Value",
                                            "altitude" : "Example String Value",
                                            "altitudeUnitOfMeasure_Enum" : "Inches",
                                            "mapURL" : "http://www.OpenTravel.org/ns/OTA2/Common_v01_00",
                                            "formatURL" : "http://www.w3.org/2001/XMLSchema"
                                        }
                                    } ],
                                    "DateTimeStamp" : {
                                        "value" : "2011-12-05T06:00:00Z",
                                        "create" : "2011-01-24T09:45:00-06:00",
                                        "creatorID" : "c123456789",
                                        "lastModify" : "2011-07-04T14:15:00+06:00",
                                        "lastModifierID" : "m987654321",
                                        "purge" : "2011-07-04"
                                    }
                                }
                            } ],
                            "HoldTime" : {
                                "value" : "2011-12-05T06:00:00Z",
                                "create" : "2011-01-24T09:45:00-06:00",
                                "creatorID" : "c123456789",
                                "lastModify" : "2011-07-04T14:15:00+06:00",
                                "lastModifierID" : "m987654321",
                                "purge" : "2011-12-05"
                            }
                        }
                    } ],
                    "Product" : [ {
                        "@type" : "Product",
                        "objID" : "product_1",
                        "Identifier" : {
                            "value" : "guid12345",
                            "url" : "http://www.w3.org/2001/XMLSchema",
                            "system" : "sysABC3344",
                            "organization" : "Acme"
                        },
                        "ProductRef" : "product_1",
                        "AssociatedProductIdentifier" : [ {
                            "objID" : "associatedProduct_1",
                            "Identifier" : {
                                "value" : "guid12345",
                                "url" : "http://www.OpenTravel.org/ns/OTA2/Common_v01_00",
                                "system" : "sysABC3344",
                                "organization" : "Acme"
                            },
                            "ProductRef" : "product_2"
                        } ]
                    } ],
                    "FacilityIdentifier" : {
                        "objID" : "facility_2",
                        "FacilityRef" : "facility_2",
                        "FacilityKey" : {
                            "@type" : "FacilityKeyIdentifier",
                            "Identifier" : {
                                "value" : "guid12345",
                                "url" : "http://www.w3.org/2001/XMLSchema",
                                "system" : "sysABC3344",
                                "organization" : "Acme"
                            }
                        }
                    }
                } ],
                "ReferenceListProduct" : {
                    "Product" : {
                        "@type" : "Product",
                        "objID" : "product_2",
                        "Identifier" : {
                            "value" : "guid12345",
                            "url" : "http://www.OpenTravel.org/ns/OTA2/Common_v01_00",
                            "system" : "sysABC3344",
                            "organization" : "Acme"
                        },
                        "ProductRef" : "product_1",
                        "AssociatedProductIdentifier" : [ {
                            "objID" : "associatedProduct_2",
                            "Identifier" : {
                                "value" : "guid12345",
                                "url" : "http://www.w3.org/2001/XMLSchema",
                                "system" : "sysABC3344",
                                "organization" : "Acme"
                            },
                            "ProductRef" : "product_2"
                        } ]
                    }
                }
            },
            "PayloadStdAttributes" : {
                "value" : null,
                "echoToken" : "Example String Value",
                "timeStamp" : "2011-12-05T06:00:00Z",
                "target" : "Test",
                "targetName" : "Example String Value",
                "version" : 34,
                "transactionIdentifier" : "Example String Value",
                "sequenceNmbr" : "Example String Value",
                "transactionStatusCode" : "Start",
                "correlationID" : "Example String Value",
                "primaryLangID" : "en",
                "altLangID" : "es",
                "retransmissionIndicatorInd" : true
            },
            "Result" : {
                "@type" : "Result",
                "Errors" : [ {
                    "value" : "Example String Value",
                    "language" : "en",
                    "type" : "Authorization",
                    "typeExtension" : "type_Other_Value",
                    "shortText" : "Example String Value",
                    "code" : "2",
                    "docURL" : "http://www.OpenTravel.org/ns/OTA2/Common_v01_00",
                    "tag" : "Example String Value",
                    "recordID" : "Example String Value",
                    "nodeList" : "Example String Value",
                    "status" : "Complete",
                    "statusExtension" : "status_Other_Value"
                } ],
                "Warnings" : [ {
                    "value" : "Example String Value",
                    "language" : "en",
                    "type" : "Business rule",
                    "typeExtension" : "type_Other_Value",
                    "shortText" : "Example String Value",
                    "code" : "2",
                    "docURL" : "http://www.w3.org/2001/XMLSchema",
                    "tag" : "Example String Value",
                    "recordID" : "Example String Value",
                    "nodeList" : "Example String Value",
                    "status" : "Incomplete",
                    "statusExtension" : "status_Other_Value"
                } ],
                "Status" : {
                    "value" : "Not processed"
                }
            }
        }
    };
    req.setJsonPayload(payload);
    // Send a 'post' request and obtain the response
    http:Response response = check publisherEP->post("/publishMessage", req);
    // Expected response code is 200
    test:assertEquals(response.statusCode, 200, msg = "publisher service did not respond with 200 OK signal!");
    // Check whether the response is as expected
    json resPayload = check response.getJsonPayload();
    json expected = { "Message": "Offer Published Successfully !" };
    test:assertEquals(resPayload, expected, msg = "Response mismatch!");
}
