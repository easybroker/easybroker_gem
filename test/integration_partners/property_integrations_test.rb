require "test_helper"

module IntegrationPartners
  class PropertyIntegrationsTest < EasyBrokerTestBase
    attr_reader :property_integrations

    def setup
      @property_integrations = EasyBroker::IntegrationPartners::PropertyIntegrations.new(EasyBroker::ApiClient.new)
    end

    def test_update
      stub_verb_request(:put, '/integration_partners/properties/1/property_integration', body: { status: 'successful', listing_url: "https://www.mywebsite.com/EB-XXXX01" }).
        to_return(body: { status: 'successful' }.to_json)
      response = property_integrations.update(1, body: { status: 'successful', listing_url: "https://www.mywebsite.com/EB-XXXX01" })
      assert_equal 'successful', response.status
    end
  end
end
