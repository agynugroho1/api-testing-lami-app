Feature: Culture LamiApp

  @Positive
  Scenario: GET Culture List
    When I send GET Request to List Culture with query "page" is "1" and "limit" is "12"
    Then Response code is 200
    And Response body should be with jsonSchema "cultures/list-cultures.json"

  @Negative
  Scenario: GET Culture List Invalid query page
    When I send GET Request to List Culture with query "page" is "%" and "limit" is "12"
    Then Response code is 400
    And Response body with jsonPath "message" should be equal "wrong query param"

  @Negative
  Scenario: GET Culture List Invalid query limit
    When I send GET Request to List Culture with query "page" is "1" and "limit" is "@"
    Then Response code is 400
    And Response body with jsonPath "message" should be equal "wrong query param"

  @Positive
  Scenario: GET Culture Detail
    When I send GET Request for culture detail using path "/1"
    Then Response code is 200
    And Response body should be with jsonSchema "cultures/culture-detail.json"

  @Negative
  Scenario: GET Culture Detail invalid path
    When I send GET Request for culture detail using path "/$"
    Then Response code is 400
    And Response body with jsonPath "message" should be equal "wrong param"

  @Positive @MustLoginAdmin
  Scenario: POST Create Culture
    Given I set Bearer Token with "bearer-admin.txt" which is in line 1
    When I send POST Request for create culture with "name" is "Test Cultures", "image" is "image-profile.png", "city" is "Jakarta", "details" is "Detail of Testing, Lorem Ipsum Sit Dolor Amey"
    Then Response code is 200
    And Response body with jsonPath "message" should be equal "Success to insert culture"

  @Negative @SpecialCharacter @MustLoginAdmin
  Scenario: POST Create Culture with special character on city
    Given I set Bearer Token with "bearer-admin.txt" which is in line 1
    When I send POST Request for create culture with "name" is "Test Cultures", "image" is "image-profile.png", "city" is "Jakarta_", "details" is "Detail of Testing, Lorem Ipsum Sit Dolor Amey"
    Then Response code is 400
    And Response body with jsonPath "message" should be equal "failed syntax city"

  @Negative @Numeric @MustLoginAdmin
  Scenario: POST Create Culture with numeric on city
    Given I set Bearer Token with "bearer-admin.txt" which is in line 1
    When I send POST Request for create culture with "name" is "Test Cultures", "image" is "image-profile.png", "city" is "Jakarta69", "details" is "Detail of Testing, Lorem Ipsum Sit Dolor Amey"
    Then Response code is 400
    And Response body with jsonPath "message" should be equal "failed syntax city"

  @Negative @NotFilled @MustLoginAdmin
  Scenario: POST Create Culture with name not filled
    Given I set Bearer Token with "bearer-admin.txt" which is in line 1
    When I send POST Request for create culture with "name" is "", "image" is "image-profile.png", "city" is "Jakarta", "details" is "Detail of Testing, Lorem Ipsum Sit Dolor Amey"
    Then Response code is 400
    And Response body with jsonPath "message" should be equal "all data must be filled"

  @Negative @NotFilled @MustLoginAdmin
  Scenario: POST Create Culture with image not filled
    Given I set Bearer Token with "bearer-admin.txt" which is in line 1
    When I send POST Request for create culture with "name" is "Test Culture", "image" is "", "city" is "Jakarta", "details" is "Detail of Testing, Lorem Ipsum Sit Dolor Amey"
    Then Response code is 400
    And Response body with jsonPath "message" should be equal "failed to get file"

  @Negative @NotFilled @MustLoginAdmin
  Scenario: POST Create Culture with city not filled
    Given I set Bearer Token with "bearer-admin.txt" which is in line 1
    When I send POST Request for create culture with "name" is "Test Culture", "image" is "image-profile.png", "city" is "", "details" is "Detail of Testing, Lorem Ipsum Sit Dolor Amey"
    Then Response code is 400
    And Response body with jsonPath "message" should be equal "all data must be filled"

  @Negative @NotFilled @MustLoginAdmin
  Scenario: POST Create Culture with details not filled
    Given I set Bearer Token with "bearer-admin.txt" which is in line 1
    When I send POST Request for create culture with "name" is "Test Culture", "image" is "image-profile.png", "city" is "Jakarta69", "details" is ""
    Then Response code is 400
    And Response body with jsonPath "message" should be equal "all data must be filled"

