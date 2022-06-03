# frozen_string_literal: true

module EasyBroker
  module IntegrationPartners
    class ListingStatuses
      ENDPOINT = '/integration_partners/listing_statuses'

      attr_reader :api_client

      def initialize(api_client)
        @api_client = api_client
      end

      def search(query = {})
        stored_query = EasyBroker::Query.new(api_client, ENDPOINT, query)
        EasyBroker::PaginatedResponse.new(stored_query)
      end
    end
  end
end
