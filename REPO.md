## TEAS USPTO TEST AUTOMATION USING JENKINS CI and BROWSERSTACK

This repo implements web automation testing with capybara/cucumber and browserstack.
Notable use of Selenium, Parallel tests, and Rake.

### URLS

The following URLS are needed and used in this repo

 * [Github Repo](https://github.com/STSILABS/cucumber-docker)
 * [BrowserStack](https://www.browserstack.com/automate)
 * [Jenkins](https://jenkins.io/)
 * Unless port is otherwise specified, CI server is served on localhost:8080
  
 ### CLI STEPS

After cloning repository and using terminal to get to the directory.
*Note: Be sure to enter in your browserstack username and access key ENV variables within the ~./config directory*
 * `gem install bundler`
 * `bundle install`
 * `rake attorney_plus` - to run standard single test in browserstack
 * `rake parallel` - to run parallel tests for multiple browsers within browserstack
 * `rake local` - to run on localhost within browserstack
 * `rake dev` - to run tests on local machine. *Note: can add `browser=chrome` to test on chrome*

### CI STEPS
 After setting up jenkins and logging on:
 1. New item - enter name, click freestyle project, then click ok.
 2. Click manage jenkins -> manage plugins and make sure you have installed the rvm plugin.
 3. In the new Jenkins project click on configure and link the github project URL and git repo under source code management.
 4. Under build environment, make sure to check "Run the build in a RVM-managed environment" with the default implementation.
 5. Under Build, click "Add build step" and enter:
 ```
 sudo gem install bundler
 bundle
 rake attorney_plus
 ```
 6. Click "Save" and then "Build Now".
 
### Files to have open

 * ~./config/attorney_plus.config.yml
 * ~./config/local.config.yml
 * ~./config/parallel.config.yml
