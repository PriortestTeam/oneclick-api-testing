@Var
Feature: to test API Authentication

  Background: declare variables
  * url 'https://reqres.in/api/register'

  Scenario: Authentication Test
    Given path 'toke'
    And form field grant_type = 'client_credentials'
    And form field client_id = ''
    And form field client_secret = ''
    When method POST
    Then status 201
    And print response
    * def accessToken = response.access_toke
    And print accessToken

    Given path ''
    And header Autherization = 'cerulean' + accessToken
    When method Get
    Then status 200
    And print response
