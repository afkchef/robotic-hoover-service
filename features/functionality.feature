Feature: Test API service for functional and specification correctness

    Scenario: Test with valid JSON payload, no patches crossed
        Given I have the following JSON payload
        """
        {
            "roomSize" : [10, 10],
            "coords" : [3, 8],
            "patches" : [
                [1, 0],
                [2, 2],
                [2, 3]
            ],
            "instructions" : "NESSSSWWW"
        }
        """
        When I send a POST request to the API with the payload
        Then the response should have status code 200
        And the response should have JSON body
        """
        {
            "coords" : [1, 5],
            "patches" : 0
        }
        """

        Scenario: Test with valid JSON payload, multiple patches crossed and skids in-place once
        Given I have the following JSON payload
        """
        {
            "roomSize" : [10, 10],
            "coords" : [3, 3],
            "patches" : [
                [2, 3],
                [1, 3],
                [0, 3]
            ],
            "instructions" : "NNNSSSWWWW"
        }
        """
        When I send a POST request to the API with the payload
        Then the response should have status code 200
        And the response should have JSON body
        """
        {
            "coords" : [0, 3],
            "patches" : 3
        }
        """

        Scenario: Test with valid JSON payload, remove the starting dirt patch and move on
        Given I have the following JSON payload
        """
        {
            "roomSize" : [10, 10],
            "coords" : [1, 1],
            "patches" : [
                [1, 1]
            ],
            "instructions" : "SSSEEEEE"
        }
        """
        When I send a POST request to the API with the payload
        Then the response should have status code 200
        And the response should have JSON body
        """
        {
            "coords" : [6, 0],
            "patches" : 1
        }
        """
