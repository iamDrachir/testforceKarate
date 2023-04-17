Feature: Creating user (additional scenario for negative test case)

Background:
    * def baseURL = 'https://reqres.in/api'
    * def createUserData = read('classpath:reqResApp/testData/createUserPayload.json')

@Positive @Progression @Regression
Scenario: Validate user creation with request
    Given url baseURL +'/register'
    And request createUserData.users[1]
    And header Accept = 'application/json'
    When method post
    Then status 200
    * match response.id == '#notnull'
    * match response.token == '#notnull'
    * match response == {"id": "#number", "token": "#string"}
    * def myToken = response.token
    * print 'The dummy token is: ' + myToken

@Negative @Progression @Regression
Scenario: Validate user creation without request
    Given url baseURL +'/register'
    And header Accept = 'application/json'
    When method post
    Then status 400
    * match response.error == 'Missing email or username'
