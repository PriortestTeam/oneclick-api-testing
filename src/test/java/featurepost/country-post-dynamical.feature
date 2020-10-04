Feature: to test post call

  Background:
    * def javaMethod = Java.type('com.oneclick.karate.util.MyCustomClass')
    * url 'https://dummy.restapiexample.com/api/v1/create'

  @dataDynamically
  Scenario: post for user creation with user name dynamically
    * def returnedUserName = javaMethod.userNameGenerator()
    * def password = returnedUserName + "001@Gmail.com"
    * def userInfo = { "userName":#(returnedUserName), "password":#(password)}
    And print userInfo
    And request userInfo
    When method post
    Then status 200
    And print response
    And match $.data.userName == userInfo.userName

  @dataDynamically
  Scenario: upload file with data dynamically
    * url 'https://postman-echo.com/post'
    * def returnedUserName = javaMethod.userNameGenerator()
    * def email = returnedUserName + "001@Gmail.com"
    * def value = { "userName":#(returnedUserName), "email":#(email)}
    And multipart file myFile = { value:'#(value)', filename: 'testingData.json', contentType: 'application/json' }
    And multipart field message = 'upload file'
    When method post
    Then status 200
    And print value
    And print response