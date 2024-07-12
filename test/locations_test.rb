require "test_helper"

class LocationsTest < EasyBrokerTestBase
  attr_reader :locations

  def setup
    @locations = EasyBroker::Locations.new(EasyBroker::ApiClient.new)
  end

  def test_find
    stub_verb_request(:get, '/locations', query: { query: 'test' }).
      to_return(body: { name: 'test' }.to_json)
    location = locations.find('test')
    assert_equal 'test', location.name
  end
end
