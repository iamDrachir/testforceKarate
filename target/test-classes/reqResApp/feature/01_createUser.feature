Feature: Creating user

Background:
    * def baseURL = 'https://reqres.in/api'
    * def createUserData = read('classpath:reqResApp/testData/createUserPayload.json')

@tokenGeneration @Shakeout @Regression
Scenario: Create user and retrieve a dummy token
    Given url baseURL +'/register'
    And request createUserData.users[1]
    And header Accept = 'application/json'
    When method post
    Then status 200
    * match response.id == '#notnull'
    * match response.token == '#notnull'
    * match response == {"id": "#number", "token": "#string"}
    * def myToken = response.token
    * print 'My token is: ' + myToken
