When(/^I choose "([^"]*)" for "([^"]*)"$/) do |value, field_name|
  entity_type_lookup = {
    "Corporation":"owner.corporation",
    "Individual":"owner.individual",
    "Partnership":"owner.partnership"
  }
  choose entity_type_lookup[value.to_sym]
end

When(/^I fill in "([^"]*)" for "([^"]*)"$/) do |value, field|
  fill_in field, with:value
end

Then(/^I should see a form validation error message$/) do
  expect(page).to have_content "The following error(s)"
end

Then(/^the "([^"]*)" field should be displayed$/) do |field_label|
  field = find_all('label').select{|l|l.text.include? field_label}
  expect(field.length).to eq 1
end
