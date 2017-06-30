# require 'capybara/poltergeist'
require 'capybara/cucumber'
require 'byebug'

Capybara.app_host = "https://teas.uspto.gov/forms"
# Drivers: poltergeist or selenium
Capybara.default_driver = :selenium
Capybara.javascript_driver = :selenium
