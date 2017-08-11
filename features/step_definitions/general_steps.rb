Given /^I am on the 'home' page$/ do
  visit "/"
end

When(/^I fill in "([^"]*)" for search keywords$/) do |keywords|
  fill_in('search-field',with:keywords)
end

When(/^I select "([^"]*)" for the Basis filter$/) do |value|
  page.find('h3.filter-heading',text:"Filters").click
  page.find('div.filter-group-title',text:"Basis").click
  page.find('label#basis_use').click
end

Then(/^I should see the record for serial "(\d+)"$/) do |serial|
  page.assert_selector 'td[data-label="Serial Number"]',text:serial
end

Then(/^I should NOT see the record for serial "(\d+)"$/) do |serial|
  page.assert_no_selector 'td[data-label="Serial Number"]',text:serial
end

When(/^I should save page as html$/) do
  require 'capybara-screenshot/cucumber'
  Capybara.save_path = "508scan/files_to_scan"
  Capybara.save_page
end
