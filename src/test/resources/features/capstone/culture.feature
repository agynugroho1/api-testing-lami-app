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
    Given I set Bearer Token
    When I send "POST Request for create" culture with "name" is "Test Cultures", "image" is "image-profile.png", "city" is "Jakarta", "details" is "Detail of Testing, Lorem Ipsum Sit Dolor Amey"
    Then Response code is 200
    And Response body with jsonPath "message" should be equal "Success to insert culture"

  @Negative @SpecialCharacter @MustLoginAdmin
  Scenario: POST Create Culture with special character on city
    Given I set Bearer Token
    When I send "POST Request for create" culture with "name" is "Test Cultures", "image" is "image-profile.png", "city" is "Jakarta_", "details" is "Detail of Testing, Lorem Ipsum Sit Dolor Amey"
    Then Response code is 400
    And Response body with jsonPath "message" should be equal "failed syntax city"

  @Negative @Numeric @MustLoginAdmin
  Scenario: POST Create Culture with numeric on city
    Given I set Bearer Token
    When I send "POST Request for create" culture with "name" is "Test Cultures", "image" is "image-profile.png", "city" is "Jakarta69", "details" is "Detail of Testing, Lorem Ipsum Sit Dolor Amey"
    Then Response code is 400
    And Response body with jsonPath "message" should be equal "failed syntax city"

  @Negative @NotFilled @MustLoginAdmin
  Scenario: POST Create Culture with name not filled
    Given I set Bearer Token
    When I send "POST Request for create" culture with "name" is "", "image" is "image-profile.png", "city" is "Jakarta", "details" is "Detail of Testing, Lorem Ipsum Sit Dolor Amey"
    Then Response code is 400
    And Response body with jsonPath "message" should be equal "all data must be filled"

  @Negative @NotFilled @MustLoginAdmin
  Scenario: POST Create Culture with image not filled
    Given I set Bearer Token
    When I send "POST Request for create" culture with "name" is "Test Culture", "image" is "", "city" is "Jakarta", "details" is "Detail of Testing, Lorem Ipsum Sit Dolor Amey"
    Then Response code is 400
    And Response body with jsonPath "message" should be equal "failed to get file"

  @Negative @NotFilled @MustLoginAdmin
  Scenario: POST Create Culture with city not filled
    Given I set Bearer Token
    When I send "POST Request for create" culture with "name" is "Test Culture", "image" is "image-profile.png", "city" is "", "details" is "Detail of Testing, Lorem Ipsum Sit Dolor Amey"
    Then Response code is 400
    And Response body with jsonPath "message" should be equal "all data must be filled"

  @Negative @NotFilled @MustLoginAdmin
  Scenario: POST Create Culture with details not filled
    Given I set Bearer Token
    When I send "POST Request for create" culture with "name" is "Test Culture", "image" is "image-profile.png", "city" is "Jakarta69", "details" is ""
    Then Response code is 400
    And Response body with jsonPath "message" should be equal "all data must be filled"

  @Positive @MustLoginAdmin
  Scenario: PUT Update Culture
    Given I set Bearer Token
    And I set path "/5"
    When I send "PUT Request for update" culture with "name" is "Test Cultures", "image" is "image-profile.png", "city" is "Jakarta", "details" is "Detail of Testing, Lorem Ipsum Sit Dolor Amey"
    Then Response code is 200
    And Response body with jsonPath "message" should be equal "Success to update data culture"

  @Negative @SpecialCharacter @MustLoginAdmin
  Scenario: PUT Update Culture with special character on city
    Given I set Bearer Token
    And I set path "/5"
    When I send "PUT Request for update" culture with "name" is "Test Cultures", "image" is "image-profile.png", "city" is "Jakarta_", "details" is "Detail of Testing, Lorem Ipsum Sit Dolor Amey"
    Then Response code is 400
    And Response body with jsonPath "message" should be equal "failed syntax city"

  @Negative @Numeric @MustLoginAdmin
  Scenario: PUT Update Culture with numeric on city
    Given I set Bearer Token
    And I set path "/5"
    When I send "PUT Request for update" culture with "name" is "Test Cultures", "image" is "image-profile.png", "city" is "Jakarta69", "details" is "Detail of Testing, Lorem Ipsum Sit Dolor Amey"
    Then Response code is 400
    And Response body with jsonPath "message" should be equal "failed syntax city"

  @Negative @NotFilled @MustLoginAdmin
  Scenario: PUT Update Culture with name not filled
    Given I set Bearer Token
    And I set path "/5"
    When I send "PUT Request for update" culture with "name" is "", "image" is "image-profile.png", "city" is "Jakarta", "details" is "Detail of Testing, Lorem Ipsum Sit Dolor Amey"
    Then Response code is 200
    And Response body with jsonPath "message" should be equal "Success to update data culture"

  @Negative @NotFilled @MustLoginAdmin
  Scenario: PUT Update Culture with image not filled
    Given I set Bearer Token
    And I set path "/5"
    When I send "PUT Request for update" culture with "name" is "Test Culture", "image" is "", "city" is "Jakarta", "details" is "Detail of Testing, Lorem Ipsum Sit Dolor Amey"
    Then Response code is 200
    And Response body with jsonPath "message" should be equal "Success to update data culture"

  @Negative @NotFilled @MustLoginAdmin
  Scenario: PUT Update Culture with city not filled
    Given I set Bearer Token
    And I set path "/5"
    When I send "PUT Request for update" culture with "name" is "Test Culture", "image" is "image-profile.png", "city" is "", "details" is "Detail of Testing, Lorem Ipsum Sit Dolor Amey"
    Then Response code is 200
    And Response body with jsonPath "message" should be equal "Success to update data culture"

  @Negative @NotFilled @MustLoginAdmin
  Scenario: PUT Update Culture with details not filled
    Given I set Bearer Token
    And I set path "/5"
    When I send "PUT Request for update" culture with "name" is "Test Culture", "image" is "image-profile.png", "city" is "Jakarta", "details" is ""
    Then Response code is 200
    And Response body with jsonPath "message" should be equal "Success to update data culture"

  @Negative @InvalidPath @MustLoginAdmin
  Scenario: PUT Update Culture with Ivalid path
    Given I set Bearer Token
    And I set path "/%"
    When I send "PUT Request for update" culture with "name" is "Test Culture", "image" is "image-profile.png", "city" is "Jakarta69", "details" is "x"
    Then Response code is 400
    And Response body with jsonPath "message" should be equal "wrong param"

  @Positive @MustLoginAdmin
  Scenario: DELETE Culture
    Given I set Bearer Token
    And I set path "/21"
    When I send DELETE Request culture
    Then Response code is 200
    And Response body with jsonPath "message" should be equal "Success to delete data culture"

  @Negative @InvalidPath @MustLoginAdmin
  Scenario: DELETE Culture invalid path
    Given I set Bearer Token
    And I set path "/$"
    When I send DELETE Request culture
    Then Response code is 400
    And Response body with jsonPath "message" should be equal "wrong param"

  @Negative @SamePath @MustLoginAdmin
  Scenario: DELETE Culture same path with deleted path
    Given I set Bearer Token
    And I set path "/6"
    When I send DELETE Request culture
    Then Response code is 400
    And Response body with jsonPath "message" should be equal "Failed to delete data culture"

  @Negative @WithoutBearer @MustLoginAdmin
  Scenario: DELETE Culture without bearer token
    And I set path "/12"
    When I send DELETE Request culture
    Then Response code is 400
    And Response body with jsonPath "message" should be equal "missing or malformed jwt"

  @Posisitive @MustLogin
  Scenario: POST Report culture
    Given I set Bearer Token
    And I set path "/10"
    When I POST request for report culture with message is "report/send-report.json"
    Then Response code is 200
    And Response body with jsonPath "message" should be equal "Success to insert culture report"

  @Posisitive @MustLoginAdmin
  Scenario: GET Report culture
    Given I set Bearer Token
    And I set path "/13"
    When I GET Request for report cultures
    Then Response code is 200
    And Response body with jsonPath "message" should be equal "Success get culture report"