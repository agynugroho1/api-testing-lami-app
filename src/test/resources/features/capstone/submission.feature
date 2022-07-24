Feature: Submission UMKM and Event

  @Positive @AllApplyUMKM @MustLoginAdmin
  Scenario: Admin GET all list submission
    Given I set Bearer Token
    When I send GET request to view list "submission" with params "page" is "1" and "limit" is "12"
    Then Response code is 200
    And Response body should be with jsonSchema "submission/get-list-submission-schema.json"

  @Negative @InvalidTokenUMKM
  Scenario:  Admin GET all list submission with invalid token
    Given I set Bearer Token
    When I send GET request to view list "submission" with params "page" is "1" and "limit" is "12"
    Then Response code is 401
    And Response body with jsonPath "message" should be equal "invalid or expired jwt"

  @Negative @WithoutTokenUMKM
    Scenario: Admin GET all list submission without bearer token
    When I send GET request to view list "submission" with params "page" is "1" and "limit" is "12"
    Then Response code is 400
    And Response body with jsonPath "message" should be equal "missing or malformed jwt"


  @Positive @UpdateStatusUserUMKM @MustLoginAdmin
  Scenario: Update status store submission
    Given I set Bearer Token
    When I send PUT request to update status store userID is "50"
    Then The response status code 200
    And Response body should be with jsonSchema "submission/put-update-submission-schema.json"
    And Response body with jsonPath "message" should be equal "success update data"

  @Negative @InvalidUserID @MustLoginAdmin
  Scenario: Update status store submission userID with Number and Special Char.
    Given I set Bearer Token
    When I send PUT request to update status store userID is "5-"
    Then The response status code 400
    And Response body with jsonPath "message" should be equal "wrong param"

  @Negative @WithoutInputToken
  Scenario: Update status store submission without input token
    When I send PUT request to update status store userID is "5"
    Then The response status code 400
    And Response body with jsonPath "message" should be equal "missing or malformed jwt"

  @Negative @InvalidInputToken
  Scenario: Update status store submission with invalid token
    Given I set Bearer Token
    When I send PUT request to update status store userID is "5"
    Then The response status code 401
    And Response body with jsonPath "message" should be equal "invalid or expired jwt"


  @Positive @ListEvent @MustLoginAdmin
    Scenario: Admin GET all list event
    Given I set Bearer Token
    When I send GET request to view list "event" with params "page" is "1" and "limit" is "12"
    Then Response code is 200
    And Response body should be with jsonSchema "submission/get-list-event-submission.json"

  @Negative @EventInvalidToken @MustLoginAdmin
  Scenario: Admin GET all list event with invalid token
    Given I set Bearer Token
    When I send GET request to view list "event" with params "page" is "1" and "limit" is "12"
    Then Response code is 401
    And Response body with jsonPath "message" should be equal "invalid or expired jwt"

  @Negative @EventWithoutToken
  Scenario: Admin GET all list submission without bearer token
    When I send GET request to view list "event" with params "page" is "1" and "limit" is "12"
    Then Response code is 400
    And Response body with jsonPath "message" should be equal "missing or malformed jwt"

  @Positive @DetailEventID @MustLoginAdmin
    Scenario: Admin GET detail event by eventID
    Given I set Bearer Token
    When I send GET request to update status event eventID is "1"
    Then Response code is 200
    And Response body should be with jsonSchema "submission/get-detail-event-byid-submission-schema.json"

  @Negative @EventInvalidUserID @MustLoginAdmin
  Scenario: Admin GET detail event with invalid userID
    Given I set Bearer Token
    When I send GET request to update status event eventID is "1*"
    Then The response status code 400
    And Response body with jsonPath "message" should be equal "wrong param"

  @Negative @EventUserInvalidToken
  Scenario: Update status store submission with invalid token
    Given I set Bearer Token
    When I send GET request to update status event eventID is "1"
    Then The response status code 401
    And Response body with jsonPath "message" should be equal "invalid or expired jwt"

  @Negative @EventUserWithoutInputToken
  Scenario: Admin GET detail event by userID without bearer token
    When I send GET request to update status event eventID is "1"
    Then The response status code 400
    And Response body with jsonPath "message" should be equal "missing or malformed jwt"


  @Positive @UpdateEvent @MustLoginAdmin
  Scenario: Admin PUT Update event
    Given I set Bearer Token
    When I send PUT request to update status event eventID is "1"
    Then The response status code 200
    And Response body should be with jsonSchema "submission/put-update-Event-schema.json"
    And Response body with jsonPath "message" should be equal "sucsess update event"

  @Negative @EventUserInvalidToken
  Scenario: Admin PUT Update event with invalid token
    Given I set Bearer Token
    When I send PUT request to update status event eventID is "1"
    Then The response status code 401
    And Response body with jsonPath "message" should be equal "invalid or expired jwt"

  @Negative @EventUserWithoutInputToken
  Scenario: Admin PUT Update event without bearer token
    When I send PUT request to update status event eventID is "1"
    Then The response status code 400
    And Response body with jsonPath "message" should be equal "missing or malformed jwt"

