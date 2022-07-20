Feature: Users Data Management

  @Positive @RegiteredUser @MustLogin
  Scenario: GET Profile User
    Given I set Bearer Token with "bearer-login.txt" which is in line 1
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
  Scenario: PUT User profile
    Given I set Bearer Token with "bearer-user.txt" which is in line 1
    When I send PUT request for profile user with data "image" is "image-profile.png", "name" is "Agy", "email" is "agytestinglami@test.com", and "password" is "rpperak"
    Then Response code is 200
    And Response body with jsonPath "message" should be equal "success update data"

  @Positive
  Scenario: PUT User profile only name and image
    Given I set Bearer Token with "bearer-user.txt" which is in line 1
    When I send PUT request for profile user with data "image" is "image-profile.png", "name" is "Agy", "email" is "", and "password" is ""
    Then Response code is 200
    And Response body with jsonPath "message" should be equal "success update data"

  @Positive
  Scenario: PUT User profile only email and password
    Given I set Bearer Token with "bearer-user.txt" which is in line 1
    When I send PUT request for profile user with data "image" is "", "name" is "", "email" is "lamiagy@test.com", and "password" is "rp100perak"
    Then Response code is 200
    And Response body with jsonPath "message" should be equal "success update data"

  @Positive
  Scenario: PUT User profile only image
    Given I set Bearer Token with "bearer-user.txt" which is in line 1
    When I send PUT request for profile user with data "image" is "image-profile.png", "name" is "", "email" is "", and "password" is ""
    Then Response code is 200
    And Response body with jsonPath "message" should be equal "success update data"

  @Positive
  Scenario: PUT User profile only name
    Given I set Bearer Token with "bearer-user.txt" which is in line 1
    When I send PUT request for profile user with data "image" is "", "name" is "Agy Nugs", "email" is "", and "password" is ""
    Then Response code is 200
    And Response body with jsonPath "message" should be equal "success update data"

  @Positive
  Scenario: PUT User profile only email
    Given I set Bearer Token with "bearer-user.txt" which is in line 1
    When I send PUT request for profile user with data "image" is "", "name" is "", "email" is "lamiagy1@test.com", and "password" is ""
    Then Response code is 200
    And Response body with jsonPath "message" should be equal "success update data"

  @Positive
  Scenario: PUT User profile only password
    Given I set Bearer Token with "bearer-user.txt" which is in line 1
    When I send PUT request for profile user with data "image" is "", "name" is "", "email" is "", and "password" is "rp1000perak"
    Then Response code is 200
    And Response body with jsonPath "message" should be equal "success update data"

  @Negative
  Scenario: PUT User profile using special character on name
    Given I set Bearer Token with "bearer-user.txt" which is in line 1
    When I send PUT request for profile user with data "image" is "image-profile", "name" is "@*@^&a", "email" is "lamiagy1@test.com", and "password" is "rp1000perak"
    Then Response code is 400
    And Response body with jsonPath "message" should be equal "failed syntax name"

  @Negative
  Scenario: PUT User profile invalid email
    Given I set Bearer Token with "bearer-user.txt" which is in line 1
    When I send PUT request for profile user with data "image" is "image-profile", "name" is "agy", "email" is "testdoang", and "password" is "rp1000perak"
    Then Response code is 400
    And Response body with jsonPath "message" should be equal "failed syntax email address"

  @Positive
  Scenario: DELETE users
    Given I set Bearer Token with "bearer-for-delete-user.txt" which is in line 1
    When I send "DELETE" request for profile user
    Then Response code is 200
    And Response body with jsonPath "message" should be equal "success delete data"

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

  @Positive
  Scenario: POST request upgrade account
    Given I set Bearer Token with "bearer-upgrade.txt" which is in line 1
    When I send POST for request upgrade account user with "storeName" is "Testing Store", "owner" is "Agy", "phone" is "6289129725170", "address" is "Jl. Kemang Raya Blok E2 No. 27", "city" is "Jakarta", and "document" is "pdf-test.pdf"
    Then Response code is 200
    And Response body with jsonPath "message" should be equal "success update data"

  @Negative @SpecialChar
  Scenario: POST request Upgrade Account using Special Character on Owner
    Given I set Bearer Token with "bearer-upgrade.txt" which is in line 1
    When I send POST for request upgrade account user with "storeName" is "Testing Store", "owner" is "Tester^&*", "phone" is "6289129725170", "address" is "Jl. Kemang Raya Blok E2 No. 27", "city" is "Jakarta", and "document" is "pdf-test.pdf"
    Then Response code is 400
    And Response body with jsonPath "message" should be equal "failed syntax"

  @Negative @SpecialChar
  Scenario: POST request Upgrade Account using Special Character on Phone number
    Given I set Bearer Token with "bearer-upgrade.txt" which is in line 1
    When I send POST for request upgrade account user with "storeName" is "Testing Store", "owner" is "Tester", "phone" is "@6289129725170", "address" is "Jl. Kemang Raya Blok E2 No. 27", "city" is "Jakarta", and "document" is "pdf-test.pdf"
    Then Response code is 400
    And Response body with jsonPath "message" should be equal "failed syntax"

  @Negative @SpecialChar
  Scenario: POST request Upgrade Account using Special Character on City
    Given I set Bearer Token with "bearer-upgrade.txt" which is in line 1
    When I send POST for request upgrade account user with "storeName" is "Testing Store", "owner" is "Tester", "phone" is "6289129725170", "address" is "Jl. Kemang Raya Blok E2 No. 27", "city" is "Wakanda@wakanda", and "document" is "pdf-test.pdf"
    Then Response code is 400
    And Response body with jsonPath "message" should be equal "failed syntax"

  @Negative @Numeric
  Scenario: POST request Upgrade Account using Numeric on Owner
    Given I set Bearer Token with "bearer-upgrade.txt" which is in line 1
    When I send POST for request upgrade account user with "storeName" is "Testing Store", "owner" is "Tester69", "phone" is "6289129725170", "address" is "Jl. Kemang Raya Blok E2 No. 27", "city" is "Jakarta", and "document" is "pdf-test.pdf"
    Then Response code is 400
    And Response body with jsonPath "message" should be equal "failed syntax"

  @Negative @Numeric
  Scenario: POST request Upgrade Account using Numeric on City
    Given I set Bearer Token with "bearer-upgrade.txt" which is in line 1
    When I send POST for request upgrade account user with "storeName" is "Testing Store", "owner" is "Tester", "phone" is "6289129725170", "address" is "Jl. Kemang Raya Blok E2 No. 27", "city" is "Wakanda69", and "document" is "pdf-test.pdf"
    Then Response code is 400
    And Response body with jsonPath "message" should be equal "failed syntax"

  @Negative @NotFilled
  Scenario: POST request Upgrade Account when phone and address not filled
    Given I set Bearer Token with "bearer-upgrade.txt" which is in line 1
    When I send POST for request upgrade account user with "storeName" is "Testing Store", "owner" is "Tester69", "phone" is "", "address" is "", "city" is "Jakarta69", and "document" is "pdf-test.pdf"
    Then Response code is 400
    And Response body with jsonPath "message" should be equal "all data must be filled"

  @Negative @NotFilled
  Scenario: POST request Upgrade Account when city and document not filled
    Given I set Bearer Token with "bearer-upgrade.txt" which is in line 1
    When I send POST for request upgrade account user with "storeName" is "Testing Store", "owner" is "Agy", "phone" is "6289129725170", "address" is "Jl. Kemang Raya Blok E2 No. 27", "city" is "", and "document" is ""
    Then Response code is 400
    And Response body with jsonPath "message" should be equal "all data must be filled"

  @Negative @NotFilled
  Scenario: POST request Upgrade Account when storeName and owner not filled
    Given I set Bearer Token with "bearer-upgrade.txt" which is in line 1
    When I send POST for request upgrade account user with "storeName" is "", "owner" is "", "phone" is "6289129725170", "address" is "Jl. Kemang Raya Blok E2 No. 27", "city" is "Jakarta", and "document" is "pdf-test.pdf"
    Then Response code is 400
    And Response body with jsonPath "message" should be equal "all data must be filled"