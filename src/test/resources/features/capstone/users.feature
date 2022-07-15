Feature: Users Data Management

  @Positive @RegiteredUser
  Scenario: GET Profile User
    Given I set Bearer Token with "bearer-user.txt" which is in line 2
    When I send "GET" request for profile user
    Then Response code is 200
    And Response body with jsonPath "data.role" should be equal "user"
    And Response body should be with jsonSchema "get-users.json"

  @Negative
  Scenario: GET Profile User without Bearer Token
    When I send "GET" request for profile user
    Then Response code is 400
    And Response body with jsonPath "message" should be equal "missing or malformed jwt"

  @Negative
  Scenario: GET Profile User with invalid Bearer Token
    Given I set Bearer Token with "invalid-bearer.txt" which is in line 1
    When I send "GET" request for profile user
    Then Response code is 401
    And Response body with jsonPath "message" should be equal "invalid or expired jwt"

  @Positive
  Scenario: PUT Update User Profile
    Given I set Bearer Token with "bearer-user.txt" which is in line 2
    When I set body with "update-user.json"
    And I send "PUT" request for profile user
    Then Response code is 200
    And Response body with jsonPath "message" should be equal "Updated Success"

  @Positive
  Scenario: DELETE users
    Given I set Bearer Token with "bearer-for-delete-user.txt" which is in line 1
    When I send "DELETE" request for profile user
    Then Response code is 200
    And Response body with jsonPath "message" should be equal "delete data"

  @Negative
  Scenario: DELETE Users without Bearer Token
    When I send "DELETE" request for profile user
    Then Response code is 400
    And Response body with jsonPath "message" should be equal "missing or malformed jwt"

  @Negative
  Scenario: Delete Users with Invalid Token
    Given I set Bearer Token with "invalid-bearer.txt" which is in line 1
    When I send "DELETE" request for profile user
    Then Response code is 401
    And Response body with jsonPath "message" should be equal "invalid or expired jwt"