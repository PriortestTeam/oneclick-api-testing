@Reuse
Feature: demo Re-use feature and Read External File with Multiple Data

  Background: declare variables
    * def compareResponse = read('classpath:src/test/resource/comparedContentMultiple.json')

  Scenario: use array to compare response
    Given url 'https://reqres.in/api/users/2'
    When method get
    Then status 200
    And match response == compareResponse[0]