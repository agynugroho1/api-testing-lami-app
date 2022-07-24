Feature: Cart

  @Positive @MustLogin
  Scenario: POST Add to cart
    Given I set Bearer Token
    When I set POST Request add to cart product with id 4
    Then Response code is 201
    And Response body with jsonPath "message" should be equal "Success to insert cart"

  @Negative @MustLogin
  Scenario: POST Add to cart invalid value product_id
    Given I set Bearer Token
    When I set POST Request add to cart product with id "4"
    Then Response code is 400
    And Response body with jsonPath "message" should be equal "failed to bind data cart"

  @Positive @MustLogin
  Scenario: GET My cart
    Given I set Bearer Token
    When I set GET Request for list cart
    Then Response code is 200
    And Response body should be with jsonSchema "carts/list-carts-schema.json"

  @Positive @MustLogin
  Scenario: PUT cart
    Given I set Bearer Token
    And I set path "/11"
    When I set PUT Request for update quantity is 5
    Then Response code is 200
    And Response body with jsonPath "message" should be equal "Success to update data cart"

  @Negative @MustLogin
  Scenario: PUT cart when qty is 0
    Given I set Bearer Token
    And I set path "/11"
    When I set PUT Request for update quantity is 0
    Then Response code is 400
    And Response body with jsonPath "message" should be equal "failed"

  @Negative @MustLogin
  Scenario: PUT cart invalid value qty
    Given I set Bearer Token
    And I set path "/11"
    When I set PUT Request for update quantity is "5"
    Then Response code is 400
    And Response body with jsonPath "message" should be equal "failed to bind data update cart"

  @Negative @MustLogin
  Scenario: POST Add to cart invalid path
    Given I set Bearer Token
    And I set path "/delapan"
    When I set PUT Request for update quantity is 5
    Then Response code is 400
    And Response body with jsonPath "message" should be equal "failed to update cart"

  @Positive @MustLogin
  Scenario: DELETE item cart
    Given I set Bearer Token
    And I set path "/11"
    When I send DELETE Request for remove data in cart page
    Then Response code is 204

  @Positive @MustLogin
  Scenario: DELETE item cart invalid path
    Given I set Bearer Token
    And I set path "/sebelas"
    When I send DELETE Request for remove data in cart page
    Then Response code is 400
    And Response body with jsonPath "message" should be equal "no rows affected"