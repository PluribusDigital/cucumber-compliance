@javascript @slow
Feature: Capture applicant information on TEAS Plus as attorney
  As an attorney
  I want to fill out
  So that I can find relevant trademark records

  Scenario: Enforce required fields
    Given I am filling out the "TEAS Plus" form as an "Attorney"
     When I fill in "ABC 123" for "Internal Address"
      And I click the "Continue" button
      And I should save page as html
     Then I should see a form validation error message

  Scenario Outline: Prompt for correct entity information
    Given I am filling out the "TEAS Plus" form as an "Attorney"
     When I choose <entity_value> for "Entity Type"
     Then the <field_label> field should be displayed

    Examples:
      | entity_value        | field_label                         |
      | "Partnership"       | "General Partners, Active Members"  |
      | "Corporation"       | "State or Country of Incorporation" |
      | "Individual"        | "Country of Citizenship"            |



  # Scenario Outline: By partial trademark text
  #   Given I am on the 'home' page
  #    When I fill in <keywords> for search keywords
  #    Then I should see the record for serial <good_result>
  #     And I should NOT see the record for serial <bad_result>
  #
  # Examples:
  #   | keywords        | good_result | bad_result |
  #   | "appl"          | "87011114"  | "86947100" |
  #   | "apple"         | "87011114"  | "86947100" |
  #   | "apple w"       | "86390028"  | "87011114" |
