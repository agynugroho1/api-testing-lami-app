#Feature: Register LamiApp
#
#  @Positive @SuccessRegister
#  Scenario: user success register with valid data
#    When I send POST request for "register" with data
#    Then The response status code 201
#    And Return body should be with jsonSchema "register-success.json"
#    And Return body with jsonPath "message" should be equal "success insert data"
#
#  @Negative @FailedRegister @SameEmail
#    Scenario: 7user failed register with the same email
#    When I send POST request for "register" with validation "same email"
#    Then The response status code 400
#    And Return body should be with jsonSchema "register-sameEmail.json"
#    And Return body with jsonPath "message" should be equal "email already used"
#
#  @Negative @InvalidEmail
#    Scenario: user failed register with invalid Email, valid Name and Password
#    When I send POST request for "register" with validation "invalid email"
#    Then The response status code 400
#    And Return body should be with jsonSchema "register-invalidemail.json"
#    And Return body with jsonPath "message" should be equal "failed syntax email address"
#
#  @Negative @SpecialCharName
#    Scenario: user input special character on Name field
#    When I send POST request for "register" with validation "special char"
#    Then The response status code 400
#    And Return body should be with jsonSchema "register-specialchar.json"
#    And Return body with jsonPath "message" should be equal "failed syntax name"
#
#  @Negative @NumberName
#  Scenario: user input Number on Name field
#    When I send POST request for "register" with validation "numeric"
#    Then The response status code 400
#    And Return body should be with jsonSchema "Register.numericname.json"
#    And Return body with jsonPath "message" should be equal "failed syntax name"