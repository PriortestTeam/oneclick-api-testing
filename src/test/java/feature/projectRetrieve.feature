Feature: to test project api

  Background:
    * url 'https://restcountries.eu/'
    * header Accept = 'application/json'

#positive case: verify to use own method
  Scenario: testing use own method
    * def MyStepdefs = Java.type('com.oneclick.karate.util.MyStepdefs')
    * string aaa = MyStepdefs.newStep()
    # verify expect value : case sensitive, expected case fail
    * match aaa == "compareKey"

#positive case: verify to return all projects
  Scenario: get a list of projects
    Given path '/rest/v2/all'
    When method get
    Then status 200
    And assert response.length == 250
    And match response[0].nativeName == 'افغانستان'

#positive case: verify to return project as given fullname
  Scenario: get specific project as given full name
    Given path '/rest/v2/name/aruba'
    And param fullText = 'true'
    When method get
    Then status 200
    And assert response.length == 1
    And match response[0].name == 'Aruba'


#negative case : given name returned no found record
  Scenario: no found record returned
    Given path '/rest/v2/name/arubaq'
    And param fullText = 'true'
    When method get
    Then status 404
    And match response contains { status: 404, message: 'Not Found' }
    #verify returned value type - string or init, expected case fail
    And match response contains { status: '404', message: 'Not Found' }

#negative case : given invalid project title

  #Scenario: get specific project as given
   # Given path ''
   # When method get
   # Then status
   # And new step