require "test_helper"

module IntegrationPartners
  class PropertyTest < EasyBrokerTestBase
    attr_reader :properties

    def setup
      @properties = EasyBroker::IntegrationPartners::Properties.new(EasyBroker::ApiClient.new)
    end

    def test_find
      stub_verb_request(:get, '/integration_partners/properties/1').
        to_return(body: { id: '1' }.to_json)
      property = properties.find(1)
      assert_equal '1', property.id
    end
  end
end
