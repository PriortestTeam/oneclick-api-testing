Feature: to test project api

  Background:
    * url 'https://restcountries.eu/'
    * header Accept = 'application/json'

  @Value
  #positive case: verify to return all countries
  Scenario: get a list of countries
    Given path '/rest/v2/all'
    When method get
    Then status 200
    And assert response.length == 250
    And match response[0].nativeName == 'افغانستان'

  @Value
  #positive case: verify to return country as given countryName
  Scenario: get specific country as given full name
    Given path '/rest/v2/name/aruba'
    And param fullText = 'true'
    When method get
    Then status 200
    And assert response.length == 1
    And match response[0].name == 'Aruba'

  @Contents
  #negative case : given wrong country name, no found record
  Scenario: no found record returned
    Given path '/rest/v2/name/arubaq'
    And param fullText = 'true'
    When method get
    Then status 404
    And match response contains { status: 404, message: 'Not Found' }
    #verify returned value type - string or init, expected case fail
    And match response contains { status: '404', message: 'Not Found' }
