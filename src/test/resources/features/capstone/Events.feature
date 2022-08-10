#Feature: Events
#
#  @Positive @CreateEvent @MustLogin
#  Scenario: POST User create event
#    Given I set Bearer Token
#    When I send POST Request for create event with "image" is "wayang-kulit.png", "document" is "wayang-kulit.pdf","name" is "Seni budaya","hostedBy" is "marco","phone" is "081265572391","startDate" is "2006-02-02T15:04", "endDate" is "2006-02-08T15:04","city" is "Yogyakarta","location" is "Candi Prambanan","details" is "seni budaya","price" is "100000"
#    Then Response code is 201
#    And Response body with jsonPath "message" should be equal "success insert event"
#
#  @Negative @InvalidData @MustLogin
#  Scenario: User Create event without attachment file
#    Given I set Bearer Token
#    When I send POST Request for create event with "image" is "", "document" is "","name" is "Seni budaya","hostedBy" is "marco","phone" is "081265572391","startDate" is "2006-02-02T15:04", "endDate" is "2006-02-08T15:04","city" is "Yogyakarta","location" is "Candi Prambanan","details" is "seni budaya","price" is "100000"
#    Then Response code is 500
#    And Response body with jsonPath "message" should be equal "failed to get image"
#
#
#  @Positive @EventList
#  Scenario: GET event list
#  When I send GET request to view event list with params "page" is "1","limit" is "12","name" is "Marco Edgar","city" is "Yogyakarta"
#    Then Response code is 200
#    And Response body should be with jsonSchema "events/get-list-event.json"
#    And Response body with jsonPath "message" should be equal "success get all events"
#
#  @Negative @EventList
#  Scenario: GET event list input numeric on name and city
#    When I send GET request to view event list with params "page" is "1","limit" is "12","name" is "123456","city" is "123456"
#    Then Response code is 400
#    And Response body with jsonPath "message" should be equal "failed parameter"
#
#  @Negative @EventList
#  Scenario: GET event list input special char on name and city
#    When I send GET request to view event list with params "page" is "1","limit" is "12","name" is "@.@,#","city" is "*&^"
#    Then Response code is 400
#    And Response body with jsonPath "message" should be equal "failed parameter"
#
#
#  @Positive @DetailEventID
#  Scenario: GET event details by eventID
#    When I send GET request to detail event by eventID is "1"
#    Then The response status code 200
#    And Response body with jsonPath "message" should be equal "success get event"
##
#  @Negative @DetailEventID
#  Scenario: GET detail event with invalid eventID ( special Char. and alphabet)
#    When I send GET request to detail event by eventID is "delapan"
#    Then The response status code 400
#    And Response body with jsonPath "message" should be equal "failed to parameter"
#
#
#  @Positive @Delete
#  Scenario: DELETE event by eventID
#    Given I set Bearer Token
#    When I send DELETE request for event by eventID "8"
#    Then Response code is 204
#    And Response body with jsonPath "message" should be equal "success delete data"
#
#  @Negative @InvalidEventID
#  Scenario: DELETE invalid eventID
#    Given I set Bearer Token
#    When I send DELETE request for event by eventID "delapan"
#    Then Response code is 404
#    And Response body with jsonPath "message" should be equal "Not Found"
#
#  @Negative @InvalidToken
#  Scenario: DELETE eventID with Invalid Token
#    Given I set Bearer Token
#    When I send DELETE request for event by eventID "9"
#    Then Response code is 404
#    And Response body with jsonPath "message" should be equal "Not Found"
#
#  @Negative @WithoutToken
#  Scenario: DELETE eventID without Bearer Token
#    When I send DELETE request for event by eventID "9"
#    Then Response code is 404
#    And Response body with jsonPath "message" should be equal "Not Found"
#
