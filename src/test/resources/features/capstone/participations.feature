#Feature: Participations
#
#  @Positive @MustLogin
#  Scenario: POST Events participations
#    Given I set Bearer Token
#    When I send "POST" Request for events participations
#    Then Response code is 201
#    And Response body with jsonPath "message" should be equal "success join"
#
#  @Negative @MustLogin
#  Scenario: POST Events participations with same events
#    Given I set Bearer Token
#    When I send "POST" Request for events participations
#    Then Response code is 400
#    And Response body with jsonPath "message" should be equal "already joined event"
#
#  @Positive @MustLogin
#  Scenario: GET Events participations
#    Given I set Bearer Token
#    When I send "GET" Request for events participations
#    Then Response code is 200
#    And Response body should be with jsonSchema "participations/participation-schema.json"