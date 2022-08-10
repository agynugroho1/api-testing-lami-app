#Feature: Products
#
#  @Positive @MustLoginUMKM
#  Scenario: POST Add product
#    Given I set Bearer Token
#    When I send "POST Request for add product" with data "image" is "image-profile.png", "name" is "Headphone X78", "details" is "Headphone untuk semua kalangan", "price" is "150000", and "stock" is "50"
#    Then Response code is 201
#    And Response body with jsonPath "message" should be equal "success to insert product"
#
#  @Negative @MustLoginUMKM
#  Scenario: POST Add product invalid value price
#    Given I set Bearer Token
#    When I send "POST Request for add product" with data "image" is "image-profile.png", "name" is "Headphone X77", "details" is "Headphone untuk semua kalangan", "price" is "agy", and "stock" is "50"
#    Then Response code is 403
#    And Response body with jsonPath "message" should be equal "failed to bind data insert product"
#
#  @Negative @MustLoginUMKM
#  Scenario: POST Add product invalid value stock
#    Given I set Bearer Token
#    When I send "POST Request for add product" with data "image" is "image-profile.png", "name" is "Headphone X77", "details" is "Headphone untuk semua kalangan", "price" is "150000", and "stock" is "agy"
#    Then Response code is 403
#    And Response body with jsonPath "message" should be equal "failed to bind data insert product"
#
#  @Negative @MustLoginUMKM
#  Scenario: POST Add product with image not filled
#    Given I set Bearer Token
#    When I send "POST Request for add product" with data "image" is "", "name" is "Headphone X77", "details" is "Headphone untuk semua kalangan", "price" is "150000", and "stock" is "50"
#    Then Response code is 400
#    And Response body with jsonPath "message" should be equal "failed to get file"
#
#  @Negative @MustLoginUMKM
#  Scenario: POST Add product with name not filled
#    Given I set Bearer Token
#    When I send "POST Request for add product" with data "image" is "image-profile.png", "name" is "", "details" is "Headphone untuk semua kalangan", "price" is "150000", and "stock" is "50"
#    Then Response code is 400
#    And Response body with jsonPath "message" should be equal "all data must be filled"
#
#  @Negative @MustLoginUMKM
#  Scenario: POST Add product with details not filled
#    Given I set Bearer Token
#    When I send "POST Request for add product" with data "image" is "image-profile.png", "name" is "Headphone X77", "details" is "", "price" is "150000", and "stock" is "50"
#    Then Response code is 400
#    And Response body with jsonPath "message" should be equal "all data must be filled"
#
#  @Negative @MustLoginUMKM
#  Scenario: POST Add product with price not filled
#    Given I set Bearer Token
#    When I send "POST Request for add product" with data "image" is "image-profile.png", "name" is "Headphone X77", "details" is "Headphone untuk semua kalangan", "price" is "", and "stock" is "50"
#    Then Response code is 400
#    And Response body with jsonPath "message" should be equal "all data must be filled"
#
#  @Positive @MustLoginUMKM
#  Scenario: POST Add product with stock not filled
#    Given I set Bearer Token
#    When I send "POST Request for add product" with data "image" is "image-profile.png", "name" is "Headphone X77", "details" is "Headphone untuk semua kalangan", "price" is "150000", and "stock" is ""
#    Then Response code is 400
#    And Response body with jsonPath "message" should be equal "all data must be filled"
#
#  Scenario: GET Product
#    When I send GET Request for list product with query "page" is "1" and "limit" is "12"
#    Then Response code is 200
#    And Response body should be with jsonSchema "products/list-product-schema.json"
#
#  Scenario: GET Detail Product
#    When I send GET Request for detail product with path "/2"
#    Then Response code is 200
#    And Response body should be with jsonSchema "products/detail-product-schema.json"
#
#  Scenario: GET Detail Product invalid path
#    When I send GET Request for detail product with path "/satu"
#    Then Response code is 500
#    And Response body with jsonPath "message" should be equal "Invalid param"
#
#  @Positive @MustLoginUMKM
#  Scenario: GET My Product
#    Given I set Bearer Token
#    When I send GET Request for my product
#    Then Response code is 200
#    And Response body should be with jsonSchema "products/list-myproduct-schema.json"
#
#  @Positive @MustLoginUMKM
#  Scenario: PUT Product
#    Given I set Bearer Token
#    And I set path "/2"
#    When I send "PUT Request for update product" with data "image" is "image-profile.png", "name" is "Headphone X77", "details" is "Headphone untuk semua kalangan", "price" is "150000", and "stock" is "50"
#    Then Response code is 200
#    And Response body with jsonPath "message" should be equal "Success to update data product"
#
#  @Positive @MustLoginUMKM
#  Scenario: PUT Product only image
#    Given I set Bearer Token
#    And I set path "/2"
#    When I send "PUT Request for update product" with data "image" is "image-profile.png", "name" is "", "details" is "", "price" is "", and "stock" is ""
#    Then Response code is 201
#    And Response body with jsonPath "message" should be equal "Success to update data product"
#
#  @Positive @MustLoginUMKM
#  Scenario: PUT Product only name
#    Given I set Bearer Token
#    And I set path "/2"
#    When I send "PUT Request for update product" with data "image" is "", "name" is "Headphone X77", "details" is "", "price" is "", and "stock" is ""
#    Then Response code is 200
#    And Response body with jsonPath "message" should be equal "Success to update data product"
#
#  @Positive @MustLoginUMKM
#  Scenario: PUT Product only details
#    Given I set Bearer Token
#    And I set path "/2"
#    When I send "PUT Request for update product" with data "image" is "", "name" is "", "details" is "Headphone untuk semua kalangan", "price" is "", and "stock" is ""
#    Then Response code is 200
#    And Response body with jsonPath "message" should be equal "Success to update data product"
#
#  @Positive @MustLoginUMKM
#  Scenario: PUT Product only price
#    Given I set Bearer Token
#    And I set path "/2"
#    When I send "PUT Request for update product" with data "image" is "", "name" is "", "details" is "", "price" is "150000", and "stock" is ""
#    Then Response code is 200
#    And Response body with jsonPath "message" should be equal "Success to update data product"
#
#  @Positive @MustLoginUMKM
#  Scenario: PUT Product only stock
#    Given I set Bearer Token
#    And I set path "/2"
#    When I send "PUT Request for update product" with data "image" is "", "name" is "", "details" is "", "price" is "", and "stock" is "50"
#    Then Response code is 200
#    And Response body with jsonPath "message" should be equal "Success to update data product"
#
#  @Negative @MustLoginUMKM
#  Scenario: PUT Product invalid value price
#    Given I set Bearer Token
#    And I set path "/2"
#    When I send "PUT Request for update product" with data "image" is "image-profile.png", "name" is "Headphone X77", "details" is "Headphone untuk semua kalangan", "price" is "agy", and "stock" is "50"
#    Then Response code is 200
#    And Response body with jsonPath "message" should be equal "Success to update data product"
#
#  @Negative @MustLoginUMKM
#  Scenario: PUT Product invalid value stock
#    Given I set Bearer Token
#    And I set path "/2"
#    When I send "PUT Request for update product" with data "image" is "image-profile.png", "name" is "Headphone X77", "details" is "Headphone untuk semua kalangan", "price" is "150000", and "stock" is "agy"
#    Then Response code is 200
#    And Response body with jsonPath "message" should be equal "Success to update data product"
#
#  @Positive @MustLoginUMKM
#  Scenario: DELETE Product
#    Given I set Bearer Token
#    And I set path "/3"
#    When I send DELETE Request for delete product
#    Then Response code is 200
#    And Response body with jsonPath "message" should be equal "Success to delete data product"
#
#  @Negative @MustLoginUMKM
#  Scenario: DELETE Product invalid path
#    Given I set Bearer Token
#    And I set path "/lima"
#    When I send DELETE Request for delete product
#    Then Response code is 500
#    And Response body with jsonPath "message" should be equal "Invalid param"
#
#  @Positive @MustLogin
#  Scenario: POST Add Product rating
#    Given I set Bearer Token
#    And I set path "/4"
#    When I send POST Request for add rating product
#    Then Response code is 201
#    And Response body with jsonPath "message" should be equal "Success to insert product rating"
#
#  @Negative @MustLoginUMKM
#  Scenario: GET Product rating
#    Given I set Bearer Token
#    And I set path "/4"
#    When I send GET Request for rating my product
#    Then Response code is 200
#    And Response body should be with jsonSchema "products/rating-product-schema.json"
#
#
#
#
