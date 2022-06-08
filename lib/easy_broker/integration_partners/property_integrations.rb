# frozen_string_literal: true

module EasyBroker
  module IntegrationPartners
    class PropertyIntegrations
      ENDPOINT = "/integration_partners/properties/%{property_id}/property_integration"

      attr_reader :api_client

      def initialize(api_client)
        @api_client = api_client
      end

      def update(property_id, body: {})
        response = api_client.put(format(ENDPOINT, property_id: property_id), body: body)
        JSON.parse(response.body, object_class: OpenStruct)
      end
    end
  end
end
