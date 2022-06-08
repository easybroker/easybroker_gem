# frozen_string_literal: true

module EasyBroker
  module IntegrationPartners
    class Agents
      ENDPOINT = '/integration_partners/agents'

      attr_reader :api_client

      def initialize(api_client)
        @api_client = api_client
      end

      def find(agent_id)
        response = api_client.get("#{ENDPOINT}/#{agent_id}")
        JSON.parse(response.body, object_class: OpenStruct)
      end
    end
  end
end
