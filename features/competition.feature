Feature: Competitions
  As the boss
  I want to manage competitions
  In order to improve my organizations

  # BG condition, it is for all scenarios
  Background: There is a team
    Given there is a team called "Random"

  Scenario: Team enters a competition with no questions
    # Optional, This steps meant for preparing for the scenario
    # Signing variables important to the test
    Given I have a competition with no questions
    # It is the action itself, it indicates the expectation
    When a team enters a competition
    Then I should see an error

  Scenario: Team enters a competition with questions
    Given I have a competition with questions
    When a team enters a competition
    Then I should not see an error