Feature: to test post call

  Background:
   * url 'https://postman-echo.com/post'
   * def javaMethod = Java.type('com.oneclick.karate.util.MyCustomClass')
   * def jsonloads = {read:'classpath:src/test/resource/comparedContent.json', filename: 'multiple_testJson.json', contentType: 'application/text'}


  Scenario: upload file as reading a file name
    * url 'https://postman-echo.com'
    Given path '/post'
    And multipart file myFile = {read:'classpath:src/test/resource/comparedContent.json', filename: 'multiple_testJson.json', contentType: 'application/text'}
    And multipart field message = 'upload file'
    When method post
    Then status 200
    And print response


  Scenario: upload file from global var
   * url 'https://postman-echo.com/post'
   And request jsonloads
   When method post
   Then status 200
   And print response

  @multiUpload
  Scenario: upload multiple files at the same time
    * url 'https://postman-echo.com/post'
    Given def uploadJson = {}
    * set uploadJson.myFirstFile = { read:'classpath:src/test/resource/multiple_testJson.json', filename: 'multiple_testJson.json', contentType: 'application/json' }
    # if you have dynamic keys you can do this
    * def key = 'mySecond'
    * uploadJson[key] = { read:'classpath:src/test/resource/multiple_testJson_second.json', filename: 'multiple_testJson_second.json', contentType: 'application/json' }
    And multipart files uploadJson
    And multipart field message = 'hello world'
    When method post
    Then status 200
    And print response

  @uploadRetry
  Scenario: upload retry
    * url 'https://postman-echo.com/post'
    * configure retry = { count: 5, interval: 5000 }
    And multipart file uploadFile = { read:'classpath:src/test/resource/multiple_testJson_second.json', filename: 'multiple_testJson_second.json', contentType: 'application/json' }
    And multipart field message = 'upload retry'
    And retry until responseStatus==201
    When method post
    Then status 200
    And print response