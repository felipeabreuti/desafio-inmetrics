require 'capybara'
require 'capybara/cucumber'
require 'capybara/rspec'
require 'selenium-webdriver'
require 'site_prism'
require 'httparty'
require 'faker'
require 'rspec'

def load_yaml_file(path)
  YAML.load_file(File.dirname(__FILE__) + path)
end

CONFIG = load_yaml_file("/config/config.yaml")
DATA = load_yaml_file("/data/test_data.yaml")

Capybara.register_driver :site_prism do |app|
  Capybara::Selenium::Driver.new(app, browser:  :chrome)  
end

Capybara.configure do |config|
  config.run_server = false
  Capybara.default_driver = :site_prism
  Capybara.page.driver.browser.manage.window.maximize 
  config.default_max_wait_time = 10  
  config.app_host = 'https://inm-test-app.herokuapp.com'
end

