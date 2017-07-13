# require 'capybara/poltergeist'
require 'capybara/cucumber'
require 'byebug'
require 'selenium-webdriver'

Capybara.app_host = "https://teas.uspto.gov/forms"
# Drivers: poltergeist or selenium
Capybara.default_driver = :selenium
Capybara.javascript_driver = :selenium

capabilities = Selenium::WebDriver::Remote::Capabilities.new

capabilities['platform'] = 'ANY'
# capabilities['name'] = 'My first Test'
capabilities['browserName'] = 'firefox'

driver = Selenium::WebDriver.for :remote, url: "http://browser:4444/wd/hub", desired_capabilities: capabilities
