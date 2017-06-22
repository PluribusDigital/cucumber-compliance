@javascript @slow
Feature: Search trademarks
  As a system user
  I want to be able to perform a modern search
  So that I can find relevant trademark records

  Scenario: By full trademark name
    Given I am on the 'home' page
     When I fill in "apple watch" for search keywords
     Then I should see the record for serial "86390028"
      And I should NOT see the record for serial "86947100"
      And I should NOT see the record for serial "87011114"

  Scenario Outline: By partial trademark text
    Given I am on the 'home' page
     When I fill in <keywords> for search keywords
     Then I should see the record for serial <good_result>
      And I should NOT see the record for serial <bad_result>

  Examples:
    | keywords        | good_result | bad_result |
    | "appl"          | "87011114"  | "86947100" |
    | "apple"         | "87011114"  | "86947100" |
    | "apple w"       | "86390028"  | "87011114" |

  Scenario: With filters
    Given I am on the 'home' page
     When I fill in "apple" for search keywords
      And I select "Use" for the Basis filter
     Then I should see the record for serial "87011114"
      And I should NOT see the record for serial "86489308"
