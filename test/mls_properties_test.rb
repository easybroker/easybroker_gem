require "test_helper"

class MlsPropertiesTest < EasyBrokerTestBase
  attr_reader :properties

  def setup
    @properties = EasyBroker::MlsProperties.new(EasyBroker::ApiClient.new)
  end

  def test_find
    stub_verb_request(:get, '/mls_properties/1').
      to_return(body: { public_id: 'test' }.to_json)
    property = properties.find(1)
    assert_equal 'test', property.public_id
  end

  def test_search
    stub_verb_request(:get, '/mls_properties', query: { page: 1 }).
      to_return(body: mock_search_body.to_json)
    results = properties.search
    assert_equal 1, results.first
  end

  private

  def mock_search_body
    {
      pagination: {
        limit: 3,
        total: 6,
        page: 1
      }, 
      content: [1, 2, 3]
    }
  end
end
