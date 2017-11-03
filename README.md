# Documentation (In Progress)
   - LIVE API https://open-library.herokuapp.com/

# Users
## Create
######METHOD: POST
######ENDPOINT: /users
######Example Request
    {
      	"data": {
      		"type": "users",
      		"attributes": {
      			"first_name": "Chris", 
      			"last_name": "Kempton", 
      			"email": "kempt09@gmail.com", 
      			"password": "Password1234"		
      		}
      	}
     }
######Example Response
    {
        "data": {
            "id": "2",
            "type": "users",
            "attributes": {
                "first_name": "Chris",
                "last_name": "Kempton",
                "email": "kempt09@gmail.com",
                "created_at": "2017-11-03T00:00:13.221Z",
                "updated_at": "2017-11-03T00:00:13.221Z"
            }
        }
    }
    
## Get Token
######METHOD: POST
######ENDPOINT: /token
######Example Request
    {
        "email": "kempt09@gmail.com",
        "password": "Password1234"
    }

######Example Response
     {
        "data": {
            "id": 2,
            "token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJlbWFpbCI6ImtlbXB0MDlAZ21haWwuY29tIiwiZXhwIjoxNTE0ODY3NzY2fQ.nqrBxkxTV683pmY8RSeaXWYQqy_xZ4bffP4suzXw0ko"
        }
     }
    
## Get User
######METHOD: GET
######Headers: "Authorization" : "token"
######ENDPOINT: /users/:id
######Example Response
    {
        "data": {
            "id": "2",
            "type": "users",
            "attributes": {
                "first_name": "Chris",
                "last_name": "Kempton",
                "email": "kempt09@gmail.com",
                "created_at": "2017-11-03T00:00:13.221Z",
                "updated_at": "2017-11-03T00:09:26.724Z"
            }
        }
    }

## Delete User
######METHOD: DELETE
######Headers: "Authorization" : "token"
######ENDPOINT: /users/:id

#Customers
## Create Customer
######METHOD: POST
######Headers: "Authorization" : "token"
######ENDPOINT: /customers
######Example Request
    {
        "data": {
            "type": "customers",
            "attributes": {
                "first_name": "Test",
                "last_name": "Customer",
                "email": "test@example.com",
                "phone": "1231231234",
                "notes": "Great Customer!"		
            }
        }
    }
######Example Response
    {
        "data": {
            "id": "1",
            "type": "customers",
            "attributes": {
                "first_name": "Test",
                "last_name": "Customer",
                "email": "test@example.com",
                "phone": "1231231234",
                "notes": "Great Customer!"
            },
            "relationships": {
                "addresses": {
                    "data": []
                },
                "log_entries": {
                    "data": []
                }
            }
        }
    }
## Update Customer
######METHOD: PUT
######Headers: "Authorization" : "token"
######ENDPOINT: /customers/:id
######Example Request
    {
        "data": {
            "type": "customers",
            "attributes": {
                "first_name": "Test",
                "last_name": "Customer",
                "email": "test@example.com",
                "phone": "1231231234",
                "notes": "Over Due Books"		
            }
        }
    }
######Example Response
    {
        "data": {
            "id": "1",
            "type": "customers",
            "attributes": {
                "first_name": "Test",
                "last_name": "Customer",
                "email": "test@example.com",
                "phone": "1231231234",
                "notes": "Over Due Books"
            },
            "relationships": {
                "addresses": {
                    "data": []
                },
                "log_entries": {
                    "data": []
                }
            }
        }
    }
    
 ## Get Customers
 ######METHOD: GET
 ######Headers: "Authorization" : "token"
 ######ENDPOINT: /customers   
 ######Example Response
    {
    	"data": [
    		{
    			"id": "1",
    			"type": "customers",
    			"attributes": {
    				"first_name": "Test",
    				"last_name": "Customer",
    				"email": "test@example.com",
    				"phone": "1231231234",
    				"notes": "Over Due Books"
    			},
    			"relationships": {
    				"addresses": {
    					"data": []
    				},
    				"log_entries": {
    					"data": []
    				}
    			}
    		},
    		{
    			"id": "2",
    			"type": "customers",
    			"attributes": {
    				"first_name": "John",
    				"last_name": "Doe",
    				"email": "test@example.com",
    				"phone": "1231231234",
    				"notes": "Great Customer!"
    			},
    			"relationships": {
    				"addresses": {
    					"data": []
    				},
    				"log_entries": {
    					"data": []
    				}
    			}
    		}
    	]
    }
    
## Get Customer
######METHOD: GET
######Headers: "Authorization" : "token"
######ENDPOINT: /customers/:id
######Example Response
    {
        "data": {
            "id": "1",
            "type": "customers",
            "attributes": {
                "first_name": "Test",
                "last_name": "Customer",
                "email": "test@example.com",
                "phone": "1231231234",
                "notes": "Over Due Books"
            },
            "relationships": {
                "addresses": {
                    "data": []
                },
                "log_entries": {
                    "data": []
                }
            }
        }
    }
    
## Get Customers By Name
######METHOD: GET
######Headers: "Authorization" : "token"
######ENDPOINT: /search/customers
######Query Params: name
######Example http://example.com/search/customers?name=john
       
## Delete Customer
######METHOD: DELETE
######Headers: "Authorization" : "token"
######ENDPOINT: /customers/:id

## Create Address
######METHOD: POST
######Headers: "Authorization" : "token"
######ENDPOINT: /addresses
######Example Request
   
    {
        "data": {
            "type": "addresses",
            "attributes": {
                "customer_id": "2",
                "street": "123 Main",
                "apt": "C",
                "city": "Detroit",
                "state": "MI",
                "country": "US",
                "zip": "12345"
            }
        }
    }
    
######Example Response 

    {
        "data": {
            "id": "3",
            "type": "addresses",
            "attributes": {
                "street": "123 Main",
                "apt": "C",
                "city": "Detroit",
                "state": "MI",
                "country": "US",
                "zip": "12345",
                "customer_id": 2,
                "created_at": "2017-11-03T00:34:59.990Z",
                "updated_at": "2017-11-03T00:34:59.990Z"
            },
            "relationships": {
                "customer": {
                    "data": {
                        "id": "2",
                        "type": "customers"
                    }
                }
            }
        }
    }
    
## Update Address
######METHOD: PUT
######Headers: "Authorization" : "token"
######ENDPOINT: /addresses/:id
######Example Request
   
    {
        "data": {
            "type": "addresses",
            "attributes": {
                "customer_id": "2",
                "street": "123 Main",
                "apt": "C",
                "city": "Detroit",
                "state": "MI",
                "country": "US",
                "zip": "12345"
            }
        }
    }
    
######Example Response 

    {
        "data": {
            "id": "3",
            "type": "addresses",
            "attributes": {
                "street": "123 Main",
                "apt": "C",
                "city": "Detroit",
                "state": "MI",
                "country": "US",
                "zip": "12345",
                "customer_id": 2,
                "created_at": "2017-11-03T00:34:59.990Z",
                "updated_at": "2017-11-03T00:34:59.990Z"
            },
            "relationships": {
                "customer": {
                    "data": {
                        "id": "2",
                        "type": "customers"
                    }
                }
            }
        }
    }
    
## Get Address
######METHOD: GET
######Headers: "Authorization" : "token"
######ENDPOINT: /addresses/:id
######Example Response 
    {
        "data": {
            "id": "3",
            "type": "addresses",
            "attributes": {
                "street": "123 Main",
                "apt": "C",
                "city": "Detroit",
                "state": "MI",
                "country": "US",
                "zip": "12345",
                "customer_id": 2,
                "created_at": "2017-11-03T00:34:59.990Z",
                "updated_at": "2017-11-03T00:34:59.990Z"
            },
            "relationships": {
                "customer": {
                    "data": {
                        "id": "2",
                        "type": "customers"
                    }
                }
            }
        },
        "included": [
            {
                "id": "2",
                "type": "customers",
                "attributes": {
                    "first_name": "John",
                    "last_name": "Doe",
                    "email": "test@example.com",
                    "phone": "1231231234",
                    "notes": "Great Customer!"
                },
                "relationships": {
                    "addresses": {
                        "data": [
                            {
                                "id": "2",
                                "type": "addresses"
                            },
                            {
                                "id": "3",
                                "type": "addresses"
                            }
                        ]
                    },
                    "log_entries": {
                        "data": []
                    }
                }
            }
        ]
    }
  
  
## Get Addresses
######METHOD: GET
######Headers: "Authorization" : "token"
######ENDPOINT: /addresses
######Example Response   
  
    {
        "data": [          
            {
                "id": "2",
                "type": "addresses",
                "attributes": {
                    "street": "123 Main",
                    "apt": "C",
                    "city": "Detroit",
                    "state": "MI",
                    "country": "US",
                    "zip": "12345",
                    "customer_id": 2,
                    "created_at": "2017-11-03T00:32:50.761Z",
                    "updated_at": "2017-11-03T00:32:50.761Z"
                },
                "relationships": {
                    "customer": {
                        "data": {
                            "id": "2",
                            "type": "customers"
                        }
                    }
                }
            },
            {
                "id": "3",
                "type": "addresses",
                "attributes": {
                    "street": "123 Main",
                    "apt": "C",
                    "city": "Detroit",
                    "state": "MI",
                    "country": "US",
                    "zip": "12345",
                    "customer_id": 2,
                    "created_at": "2017-11-03T00:34:59.990Z",
                    "updated_at": "2017-11-03T00:34:59.990Z"
                },
                "relationships": {
                    "customer": {
                        "data": {
                            "id": "2",
                            "type": "customers"
                        }
                    }
                }
            }
        ],
        "included": [
            {
                "id": "2",
                "type": "customers",
                "attributes": {
                    "first_name": "John",
                    "last_name": "Doe",
                    "email": "test@example.com",
                    "phone": "1231231234",
                    "notes": "Great Customer!"
                },
                "relationships": {
                    "addresses": {
                        "data": [
                            {
                                "id": "2",
                                "type": "addresses"
                            },
                            {
                                "id": "3",
                                "type": "addresses"
                            }
                        ]
                    },
                    "log_entries": {
                        "data": []
                    }
                }
            }
        ],
        "links": {}
    }
    
## Delete Address
######METHOD: DELETE
######Headers: "Authorization" : "token"
######ENDPOINT: /addresses/:id  