Feature: Login LamiApp

  @Positive @SuccessLogin
    Scenario: success login with valid email dan password
    When I send POST request for "login" with data
    Then The response status code 200
    And Response body should be with jsonSchema "login/login-success-schema.json"
    And Response body with jsonPath "message" should be equal "login success"

  @Negative @FailedLogin @InvalidEmail
    Scenario: login with invalid email and valid password
    When I send POST request for "login" with validation "invalid email"
    Then The response status code 404
    And Response body should be with jsonSchema "login/login-invalidemail-schema.json"
    And Response body with jsonPath "message" should be equal "user not found"


  @Negative @InvalidPassword
  Scenario: login with valid email and invalid password
    When I send POST request for "login" with validation "invalid password"
    Then The response status code 404
    And Response body should be with jsonSchema "login/login.invalidpassword-schema.json"
    And Response body with jsonPath "message" should be equal "wrong password"

  @Negative @InvalidEmailPassword
  Scenario: login with valid email and invalid email and invalid password
    When I send POST request for "login" with validation "invalid data"
    Then The response status code 404
    And Response body should be with jsonSchema "login/login-invaliddata-schema.json"
    And Response body with jsonPath "message" should be equal "user not found"