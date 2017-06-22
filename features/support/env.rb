# require 'capybara/poltergeist'
require 'capybara/cucumber'
require 'byebug'

Capybara.app_host = "http://localhost:8000/app/"
# Drivers: poltergeist or selenium
Capybara.default_driver = :selenium
Capybara.javascript_driver = :selenium
