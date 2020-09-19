@Reuse
Feature: demo Re-use feature and Read External File with Multiple Data

  Background: declare variables
    * def compareResponse = read("classpath:src/test/resource/comparedContentMultiple.json")
    * def testvarFeature = call read('test-reuse.feature')


  Scenario: compare response with other feature
    Given url "https://reqres.in/api/users/3"
    When method get
    Then status 200
    And match response == compareResponse[1]
    * def adurl = testvarfeature.response.ad.url
    And match adurl == response.ad.url
    And match response.data.id != testvarFeature.response.data.id
