## TEAS USPTO TEST AUTOMATION USING JENKINS CI and BROWSERSTACK

This repo implements web automation testing with capybara/cucumber and browserstack.
Notable use of Selenium, Parallel tests, and Rake.
This repo also implements accessibility scans via pa11y in the Jenkins Pipeline, failing a build for errors.

### URLS

The following URLS are needed and used in this repo

 * [Github Repo](https://github.com/STSILABS/cucumber-docker)
 * [BrowserStack](https://www.browserstack.com/automate)
 * [Jenkins](https://jenkins.io/)
 * [pa11y](https://github.com/pa11y/pa11y)
 * [HTML Codesniffer](http://squizlabs.github.io/HTML_CodeSniffer/)
 * Unless port is otherwise specified, CI server is served on localhost:8080
  
 ### CLI STEPS

After cloning repository and using terminal to get to the directory.
*Note: Be sure to enter in your browserstack username and access key ENV variables within the ~./config directory*
 * `gem install bundler`
 * `bundle install`
 * `rake browserstack` - to run standard single test in browserstack
 * `rake parallel` - to run parallel tests for multiple browsers within browserstack
 * `rake localhost` - to run on localhost within browserstack
 * `rake local` - to run tests on local machine. *Note: can add `browser=chrome` to test on chrome*

### Pa11y STEPS

After cloning repository and using terminal to cd into `/508scan` directory, you can run compliance tests using pa11y.     
*Note: You will need the package manager yarn which also comes with node.js*
 * `sudo npm install -g yarn` - Installs Yarn globally
You can check versions with `node --version` & `npm --version`
 * `yarn install`
 * `yarn scan508` or `yarn scan508page2`
 
You can see the script commands in the `508scan/package.json` directory and run them separately.
 1. `pa11y -s Section508 -c run508.js https://teas.uspto.gov`
 2. `pa11y -s Section508 -c run508page2.js https://teas.uspto.gov/forms/teasplus`
 
 The scans run in accordance to the 508 Standard and you can confirm the test reports by using the HTML Codesniffer plugin linked above.

### CI STEPS
 After setting up jenkins and logging on:
 1. New item - enter name, click freestyle project, then click ok.
 2. Click manage jenkins -> manage plugins and make sure you have installed the rvm plugin.
 3. In the new Jenkins project click on configure and link the github project URL and git repo under source code management.
 4. Under build environment, make sure to check "Run the build in a RVM-managed environment" with the default implementation.
 5. Under Build, click "Add build step" -> "Execute Shell" and enter:
 ```
 sudo gem install bundler
 bundle
 rake browserstack
 ```
 6. You will need to install the NODEJS plugin and follow the configuration instructions to get the recent node version, then enable it in Build Environment.
 7. Under Build, click "Add build step" -> "Execute Shell" and enter:
 ```
 sudo npm install -g yarn
 cd 508scan
 yarn install
 yarn scan508page2
 ```
 8. Click "Save" and then "Build Now".
 9. Install the cucumber test report plugin and add post-build action to publish cucumber test result report using `reports/results.json` file.
 
### Files to have open

 * ~./config/attorney_plus.config.yml
 * ~./config/local.config.yml
 * ~./config/parallel.config.yml
 * ~./508scan/package.json
