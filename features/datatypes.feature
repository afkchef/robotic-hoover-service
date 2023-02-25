Feature: Test API service with non-integer and non-string data types

    Scenario: Test with non-integer type in room size
        Given I have the following JSON payload
        """
        {
            "roomSize" : ["5", 5],
            "coords" : [3, 8],
            "patches" : [
                [1, 0],
                [2, 2],
                [2, 3]
            ],
            "instructions" : "NNESEESWNWW"
        }
        """
        When I send a POST request to the API with the payload
        Then the response should have status code 400

    Scenario: Test with non-integer type in patches
        Given I have the following JSON payload
        """
        {
            "roomSize" : [5, 5],
            "coords" : [3, 8],
            "patches" : [
                [1, 0],
                [2, "f"],
                [2, 3]
            ],
            "instructions" : "NNESEESWNWW"
        }
        """
        When I send a POST request to the API with the payload
        Then the response should have status code 400
    
    Scenario: Test with non-string type in instructions
        Given I have the following JSON payload
        """
        {
            "roomSize" : [5, 5],
            "coords" : [3, 8],
            "patches" : [
                [1, 0],
                [2, 2],
                [2, 3]
            ],
            "instructions" : 8
        }
        """
        When I send a POST request to the API with the payload
        Then the response should have status code 400