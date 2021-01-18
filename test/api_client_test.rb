require "test_helper"

class ApiClientTest < EasyBrokerTestBase
  attr_reader :client

  def setup
    @client = EasyBroker::ApiClient.new
  end

  def test_get
    stub_verb_request(:get, 'test', query: { param1: 1, param2: 2 })
    client.get('test', query: { param1: 1, param2: 2 })
  end

  def test_get_without_invalid_api_key
    @client = EasyBroker::ApiClient.new
    assert_raises EasyBroker::AuthenticationError do
      stub_verb_request(:get, 'test').to_return(status: 401)
      client.get('test')
    end
  end

  def test_logger
    logger = mock()
    logger.expects(:log)
    @client = EasyBroker::ApiClient.new(logger: logger)
    test_get
  end
end
