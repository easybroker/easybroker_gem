require "test_helper"

class LocationsTest < EasyBrokerTestBase
  attr_reader :properties

  def setup
    @properties = EasyBroker::Locations.new(EasyBroker::ApiClient.new)
  end

  def test_search
    stub_verb_request(:get, '/locations').
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
