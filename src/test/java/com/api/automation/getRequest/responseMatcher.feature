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

  Scenario: To get all the data from the apps in XML format
    Given path 'normal/webapi/all'
    And header Accept = 'application/xml'
    When method get
    Then status 200
    And print response
    And match response ==
      """
      <List>
      <item>
      <jobId>1</jobId>
      <jobTitle>Software Engg</jobTitle>
      <jobDescription>To develop andriod application</jobDescription>
      <experience>
        <experience>Google</experience>
        <experience>Apple</experience>
        <experience>Mobile Iron</experience>
      </experience>
      <project>
        <project>
          <projectName>Movie App</projectName>
          <technology>
            <technology>Kotlin</technology>
            <technology>SQL Lite</technology>
            <technology>Gradle</technology>
          </technology>
        </project>
      </project>
      </item>
      </List>
      """
      And match header Content-Type == 'application/xml'

  Scenario: To get all the data from the apps in JSON format
    Given path 'normal/webapi/all'
    And header Accept = 'application/json'
    When method get
    Then status 200
    And match response contains deep {"jobTitle": "Software Engg"}
