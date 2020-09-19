@Var
Feature: to test API Authentication



  Background: declare variables
  * url 'https://reqres.in/api/register'

  Scenario: Authentication Test

    And form field email = 'eve.holt@reqres.in'
    And form field password = 'pistol'

    When method POST
    Then status 200
    And print response
    * def accessToken = response.access_toke

    Given path ''
    And header Autherization = 'cerulean' + accessToken
    When method Get
    Then status 200
    And print response
