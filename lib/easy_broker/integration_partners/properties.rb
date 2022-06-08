# frozen_string_literal: true

module EasyBroker
  module IntegrationPartners
    class Properties
      ENDPOINT = '/integration_partners/properties'

      attr_reader :api_client

      def initialize(api_client)
        @api_client = api_client
      end

      def find(property_id)
        response = api_client.get("#{ENDPOINT}/#{property_id}")
        JSON.parse(response.body, object_class: OpenStruct)
      end
    end
  end
end
