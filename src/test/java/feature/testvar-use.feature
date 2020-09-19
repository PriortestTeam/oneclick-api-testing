@Var
Feature: to test response contents via variables


  Background: declare variables
    * def compareResponse = read('classpath:src/test/resource/comparedContent.json')
    * def compareResponseIgnoreValue = read('classpath:src/test/resource/comparedContentIgnoreValue.json')
    * def adUrl = 'http://statuscode.org/'
    * def notPresentedKey = response.ad.keyNull

  Scenario: use read method from an external file - ignore ad.text
    Given url 'https://reqres.in/api/users/2'
    When method get
    Then status 200
    And match response == compareResponseIgnoreValue
    And match response.ad.url == adUrl
    And match response.ad.text != null

  Scenario: use read method from an external file - accurate comparison
    Given url 'https://reqres.in/api/users/2'
    When method get
    Then status 200
    Then print response
    And  print compareResponse
    And match response == compareResponse
    And match response.ad.url == adUrl

  Scenario: use variable to verify if key is presented
    Given url 'https://reqres.in/api/users/2'
    When method get
    Then status 200
    Then print response
    And match response.ad.text != null
    * def notPresentedKey = response.ad.keyNull
    And match notPresentedKey == null

