Feature: to test project api

  Background:
    * url 'https://restcountries.eu/'
    * header Accept = 'application/json'

  Scenario: testing use own method
    * def MyStepdefs = Java.type('com.oneclick.karate.util.MyStepdefs')
    * string aaa = MyStepdefs.newStep()
    * match aaa == "compareKey"

#positive case: verify to return all projects
  Scenario: get a list of projects
    Given path '/rest/v2/all'
    When method get
    Then status 200
    #And assert response.length == 2
    And match response[0].nativeName == 'افغانستان'

#positive case: verify to return project as given project_title
  Scenario: get specific project as given project_title
  #  Given path ''
   # And param project_title = ''
   # When method get
   # Then status 200

#negative case : given invalid path
  #Scenario: get specific project as given
  #  Given path ''
  #  When method get
   # Then status

#negative case : given invalid project title
  #Scenario: get specific project as given
   # Given path ''
   # When method get
   # Then status
   # And new step