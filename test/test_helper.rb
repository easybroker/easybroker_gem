$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require 'easy_broker'

require 'minitest/autorun'
require 'webmock/minitest'
require 'mocha/minitest'
require 'pry'
require 'easy_broker_test_base'

EasyBroker.configure do |config|
  config.api_key = 'test_app_key'
  config.country_code = 'MX'
end
