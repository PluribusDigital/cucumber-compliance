Given(/^I am filling out the "([^"]*)" form as an "([^"]*)"$/) do |form_name, role|
  # route to appropriate form
  if form_name == "TEAS Plus"
    visit "https://teas.uspto.gov/forms/teasplus"
  else
    raise "form_name doesn't exist -  create in step definition"
  end
  # select attorney role or not
  if role == "Attorney"
    choose 'attNeededYes' # based on ID of radio button
  else
    raise "role doesn't exist -  create in step definition"
  end
  # continue to get to form
  click_button "Continue"
end

Given(/^I click the "([^"]*)" button$/) do |button_name|
  click_button button_name
end
