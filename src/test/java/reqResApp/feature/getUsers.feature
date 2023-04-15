Feature: Test to get all the users

Scenario: Get all users
    Given url 'https://reqres.in/api/users'
    When method get
    Then status 200 

Scenario: Get all users page 1
    Given url 'https://reqres.in/api/users?page=1'
    When method get
    Then status 200 
    
Scenario: Get all users page 2
    Given url 'https://reqres.in/api/users?page=2'
    When method get
    Then status 200    
    
Scenario: Get all users page 3
    Given url 'https://reqres.in/api/users?page=3'
    When method get
    Then status 200     

Scenario Outline: Get users using by page = <pageNo>
    Given url 'https://reqres.in/api/users?page=<pageNo>'
    When method get
    Then status 200
    * print response.page
    * match response.page == <pageNo>

    Examples:
    | pageNo |
    | 1      |
    | 2      |
    | 3      |