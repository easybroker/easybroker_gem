require "test_helper"

class EasyBrokerTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::EasyBroker::VERSION
  end

  def test_config
    # The config is set in test_helper
    assert EasyBroker.configuration.use_partner_code
    assert_equal 'test_app_key', EasyBroker.configuration.api_key
    assert_equal 'MX', EasyBroker.configuration.country_code
  end

  def test_api_client
    EasyBroker::ApiClient.expects(:new).with(logger: nil)
    EasyBroker.api_client
  end
end
