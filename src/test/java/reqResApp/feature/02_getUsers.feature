Feature: Test to get all the users

Background:
    * def createUser = call read('classpath:reqResApp/feature/01_createUser.feature')

@justCreateUser @Regression
Scenario: Get all users
    Given url 'https://reqres.in/api/users'
    When method get
    Then status 200 
    * print createUser.response
    * match response.data[5].email == 'tracey.ramos@reqres.in'