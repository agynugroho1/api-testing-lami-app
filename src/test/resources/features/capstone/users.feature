Feature: Users Data Management

#  @Positive @RegiteredUser
#  Scenario: GET Profile User
#    Given I set Bearer Token with "bearer-user.txt" which is in line 1
#    When I send "GET" request for profile user
#    Then Response code is 200
#    And Response body with jsonPath "data.role" should be equal "user"
#    And Response body should be with jsonSchema "get-users.json"
#
#  @Negative
#  Scenario: GET Profile User without Bearer Token
#    When I send "GET" request for profile user
#    Then Response code is 400
#    And Response body with jsonPath "message" should be equal "missing or malformed jwt"
#
#  @Negative
#  Scenario: GET Profile User with invalid Bearer Token
#    Given I set Bearer Token with "invalid-bearer.txt" which is in line 1
#    When I send "GET" request for profile user
#    Then Response code is 401
#    And Response body with jsonPath "message" should be equal "invalid or expired jwt"
#
#  @Positive
#  Scenario: PUT User profile
#    Given I set Bearer Token with "bearer-user.txt" which is in line 1
#    When I send PUT request for profile user with data "image" is "image-profile.png", "name" is "Agy", "email" is "agytestinglami@test.com", and "password" is "rpperak"
#    Then Response code is 200
#    And Response body with jsonPath "message" should be equal "success update data"
#
#  @Positive
#  Scenario: PUT User profile only name and image
#    Given I set Bearer Token with "bearer-user.txt" which is in line 1
#    When I send PUT request for profile user with data "image" is "image-profile.png", "name" is "Agy", "email" is "", and "password" is ""
#    Then Response code is 200
#    And Response body with jsonPath "message" should be equal "success update data"
#
#  @Positive
#  Scenario: PUT User profile only email and password
#    Given I set Bearer Token with "bearer-user.txt" which is in line 1
#    When I send PUT request for profile user with data "image" is "", "name" is "", "email" is "lamiagy@test.com", and "password" is "rp100perak"
#    Then Response code is 200
#    And Response body with jsonPath "message" should be equal "success update data"
#
#  @Positive
#  Scenario: PUT User profile only image
#    Given I set Bearer Token with "bearer-user.txt" which is in line 1
#    When I send PUT request for profile user with data "image" is "image-profile.png", "name" is "", "email" is "lamiagy@test.com", and "password" is "rp100perak"
#    Then Response code is 200
#    And Response body with jsonPath "message" should be equal "success update data"
#
#  @Positive
#  Scenario: PUT User profile only name
#    Given I set Bearer Token with "bearer-user.txt" which is in line 1
#    When I send PUT request for profile user with data "image" is "", "name" is "Agy Nugs", "email" is "", and "password" is ""
#    Then Response code is 200
#    And Response body with jsonPath "message" should be equal "success update data"
#
#  @Positive
#  Scenario: PUT User profile only email
#    Given I set Bearer Token with "bearer-user.txt" which is in line 1
#    When I send PUT request for profile user with data "image" is "", "name" is "", "email" is "lamiagy1@test.com", and "password" is ""
#    Then Response code is 200
#    And Response body with jsonPath "message" should be equal "success update data"
#
#  @Positive
#  Scenario: PUT User profile only password
#    Given I set Bearer Token with "bearer-user.txt" which is in line 1
#    When I send PUT request for profile user with data "image" is "", "name" is "", "email" is "", and "password" is "rp1000perak"
#    Then Response code is 200
#    And Response body with jsonPath "message" should be equal "success update data"
#
#  @Negative
#  Scenario: PUT User profile using special character on name
#    Given I set Bearer Token with "bearer-user.txt" which is in line 1
#    When I send PUT request for profile user with data "image" is "image-profile", "name" is "@*@^&a", "email" is "lamiagy1@test.com", and "password" is "rp1000perak"
#    Then Response code is 500
#    And Response body with jsonPath "message" should be equal "failed syntax name"
#
#  @Negative
#  Scenario: PUT User profile invalid email
#    Given I set Bearer Token with "bearer-user.txt" which is in line 1
#    When I send PUT request for profile user with data "image" is "image-profile", "name" is "agy", "email" is "testdoang", and "password" is "rp1000perak"
#    Then Response code is 500
#    And Response body with jsonPath "message" should be equal "failed syntax email address"
#
#  @Positive
#  Scenario: DELETE users
#    Given I set Bearer Token with "bearer-for-delete-user.txt" which is in line 1
#    When I send "DELETE" request for profile user
#    Then Response code is 200
#    And Response body with jsonPath "message" should be equal "success delete data"
#
#  @Negative
#  Scenario: DELETE Users without Bearer Token
#    When I send "DELETE" request for profile user
#    Then Response code is 400
#    And Response body with jsonPath "message" should be equal "missing or malformed jwt"
#
#  @Negative
#  Scenario: Delete Users with Invalid Token
#    Given I set Bearer Token with "invalid-bearer.txt" which is in line 1
#    When I send "DELETE" request for profile user
#    Then Response code is 401
#    And Response body with jsonPath "message" should be equal "invalid or expired jwt"