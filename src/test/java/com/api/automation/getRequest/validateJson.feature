Feature: To test the get Endpoint of the apps
  To test different end points

  Background: 
    Given url 'http://localhost:9898'
    And print 'This is background keyword'

  Scenario: To get all the data from the apps in JSON format
    Given path 'normal/webapi/all'
    And header Accept = 'application/json'
    When method get
    Then status 200
    And match response ==
      """
      [
      {
      "jobId": 1,
      "jobTitle": "Software Engg",
      "jobDescription": "To develop andriod application",
      "experience": [
      "Google",
      "Apple",
      "Mobile Iron"
      ],
      "project": [
      {
        "projectName": "Movie App",
        "technology": [
          "Kotlin",
          "SQL Lite",
          "Gradle"
        ]
      }
      ]
      }
      ]
      """
      And match response contains deep {"experience":["Google","Apple","Mobile Iron"]}
      And match response contains deep {"project" : [{"technology" :["Kotlin","Gradle"]}]}
      And match header Content-Type == 'application/json'
      And match response.[0].jobId == 1
      And match response.[0].project[0].technology[2] == 'Gradle'
      And match response.[0].project[0].projectName == 'Movie App'
      And match response.[0].project[0].technology == "#[3]"
     #wild card character
      And match response.[0].project[0].technology[*] == ['Kotlin','SQL Lite','Gradle']
      And match response.[0].experience[*] == ['Google','Apple','Mobile Iron']
     #wild card to validate a specific value
     And match response.[0].project[0].technology[*] contains ['Kotlin']
     And match response.[0].experience[*] contains ['Apple','Mobile Iron']



  