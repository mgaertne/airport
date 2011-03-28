require 'rubygems'
gem 'selenium-client'
require 'selenium/client'
require 'spec/expectations'
require 'lib/parkcalc'

# before all
selenium_driver = Selenium::Client::Driver.new \
  :host => 'localhost',
  :port => 4444,
  :browser => '*firefox',
  :url => 'http://www.shino.de/parkcalc',
  :timeout_in_second => 60
selenium_driver.start_new_browser_session
$parkcalc = ParkCalcPage.new(selenium_driver)

#after all
at_exit do
  selenium_driver.close_current_browser_session
end

