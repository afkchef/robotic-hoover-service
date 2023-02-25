Feature: Test API service with input coordinates that are out of the allowed bounds

    Scenario: Test with a room size of zero
        Given I have the following JSON payload
        """
        {
            "roomSize" : [0, 0],
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

    Scenario: Test with starting coordinates that are out of the room size
        Given I have the following JSON payload
        """
        {
            "roomSize" : [5, 5],
            "coords" : [6, 8],
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
    
    Scenario: Test with patches that are out of the room size
        Given I have the following JSON payload
        """
        {
            "roomSize" : [5, 5],
            "coords" : [4, 4],
            "patches" : [
                [7, 0],
                [8, 2],
                [9, 3]
            ],
            "instructions" : "NNESEESWNWW"
        }
        """
        When I send a POST request to the API with the payload
        Then the response should have status code 400
