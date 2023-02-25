Feature: Test API service with valid, invalid and incomplete JSON payload

    Scenario: Test with valid JSON payload
        Given I have the following JSON payload
        """
        {
            "roomSize" : [5, 5],
            "coords" : [1, 2],
            "patches" : [
                [1, 0],
                [2, 2],
                [2, 3]
            ],
            "instructions" : "NNESEESWNWW"
        }
        """
        When I send a POST request to the API with the payload
        Then the response should have status code 200
        And the response should have JSON body
        """
        {
            "coords" : [1, 3],
            "patches" : 1
        }
        """

    Scenario: Test with incomplete JSON payload
        Given I have the following JSON payload
        """
        {
            "roomSize" : [5, 5],
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

    Scenario: Test with empty JSON payload
        Given I have the following JSON payload
        """
        {}
        """
        When I send a POST request to the API with the payload
        Then the response should have status code 400