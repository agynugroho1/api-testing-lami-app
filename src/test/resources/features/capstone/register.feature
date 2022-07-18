Feature: Register LamiApp

  @Positive @SuccessRegister
  Scenario: user success register with valid data
    When I send POST request for "register" with data
    Then The response status code 201
    And Response body should be with jsonSchema "register/register-success.json"
    And Response body with jsonPath "message" should be equal "success insert data"

  @Negative @FailedRegister @SameEmail
    Scenario: 7user failed register with the same email
    When I send POST request for "register" with validation "same email"
    Then The response status code 400
    And Response body should be with jsonSchema "register/register-sameEmail.json"
    And Response body with jsonPath "message" should be equal "email already used"

  @Negative @InvalidEmail
    Scenario: user failed register with invalid Email, valid Name and Password
    When I send POST request for "register" with validation "invalid email"
    Then The response status code 400
    And Response body should be with jsonSchema "register/register-invalidemail.json"
    And Response body with jsonPath "message" should be equal "failed syntax email address"

  @Negative @SpecialCharName
    Scenario: user input special character on Name field
    When I send POST request for "register" with validation "special char"
    Then The response status code 400
    And Response body should be with jsonSchema "register/register-specialchar.json"
    And Response body with jsonPath "message" should be equal "failed syntax name"

  @Negative @NumberName
  Scenario: user input Number on Name field
    When I send POST request for "register" with validation "numeric"
    Then The response status code 400
    And Response body should be with jsonSchema "register/register.numericname.json"
    And Response body with jsonPath "message" should be equal "failed syntax name"