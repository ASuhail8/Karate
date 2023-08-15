Feature: To test the get Endpoint of the apps
  To test different end points

  Background: 
    Given url 'http://localhost:9898'
    And print 'THis is background keyword'

  Scenario: To get all the data from the apps in JSON format
    #Given url 'http://localhost:9898/normal/webapi/all'
    And path 'normal/webapi/all'
    When method get
    Then status 200

  Scenario: To get all the data from the apps in JSON format using path variable
    #Given url 'http://localhost:9898/'
    Given path 'normal/webapi/all'
    And header Accept = 'application/json'
    When method get
    Then status 200

  Scenario: To get all the data from the apps in JSON format using path variable
    #Given url 'http://localhost:9898/'
    Given path 'normal/webapi/all'
    And header Accept = 'application/xml'
    When method get
    Then status 200
