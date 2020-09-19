Feature: to test post call

  Background:
    * def jsonPayloads = read ('classpath:src/test/resource/post-userdetails.json')
    * url  'https://reqres.in/api/users'
    * headers {Content-Type: 'application/json', Accept: 'application/json'}

  Scenario: create user details
    And request jsonPayloads
    And param delay = 3
    #And header Content-Type = 'application/json'
    When  method POST
    Then status 201
    And print response

