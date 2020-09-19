@customClass
Feature: demo to use custom java class

  Background: re-use java methods
    ## call Java Class
    * def javaMethod = Java.type('com.oneclick.karate.util.MyCustomClass')
    ## record no of each page
    * def dataRecordNo = 6

  Scenario: call java method - static / none static method
    Given url "https://reqres.in/api/users?page=1"
    When method get
    * def result = response.data
    * def returnedDataNo = javaMethod.verifyDataRecordNo(result,dataRecordNo)
    * assert returnedDataNo == true
    * def emailCombination = new javaMethod().verifyEmailId(result)
    * assert emailCombination == true

  Scenario: call java method - none static method
    Given url "https://reqres.in/api/users?page=2"
    When method get
    * def result = response.data
    * def returnedDataNo = javaMethod.verifyDataRecordNo(result,dataRecordNo)
    And match returnedDataNo == true
    * def emailCombination = new javaMethod().verifyEmailId(result);
    * assert emailCombination == true

  Scenario: call java script fun
    Given url "https://reqres.in/api/users?page=2"
    When method get
    Then def result = response.data
    And def checkId = 9
    ## Sample for multiple lines
    * def testingMethod =
    """
      function(responseResult,checkId) {
       for (i=0;i<responseResult.length;i++){
          if (responseResult[i].id==checkId){
            return responseResult[i].avatar
            }
        }
      }
    """
    Then match testingMethod(result,checkId) == '#regex https://s3.amazonaws.com/uifaces/faces/twitter/.*/128.jpg'
    #Then match result[*].avatar == '#regex https://s3.amazonaws.com/uifaces/faces/twitter/.*/128.jpg'
    And match result[*].id contains [7,8,9]
    ## Sample for single line
    * def myfun = function(){return 'Hello'}
    * def data = call myfun
    Then match data == 'Hello'