Feature: Participations

  @Positive @MustLogin
  Scenario: GET Events participations
    Given I set Bearer Token
    When I send GET Request for events participations
    Then Response code is 200
    And Response body should be with jsonSchema "participations/participation-schema.json"