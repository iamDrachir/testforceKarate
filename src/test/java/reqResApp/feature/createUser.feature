Feature: Creating user


@Positive
Scenario: create a user
    Given url 'https://reqres.in/api/register'
    And request {"username": "eve.holt@reqres.in", "email": "eve.holt@reqres.in", "password": "cityslicka"}
    And header Accept = 'application/json'
    When method post
    Then status 200
    * match response.id == '#notnull'
    * match response.token == '#notnull'
    * match response == {"id": "#number", "token": "#string"}
    * def myToken = response.token
    * print 'My token is: ' + myToken

@Negative
Scenario: create a user
    Given url 'https://reqres.in/api/register'
    And header Accept = 'application/json'
    When method post
    Then status 200
    * match response.id == '#notnull'
    * match response.token == '#notnull'
    * match response == 
    """
    {
        "id": "#number", 
        "token": "#string"
    }
    """
    * def myToken = response.token
    * print 'My token is: ' + myToken
