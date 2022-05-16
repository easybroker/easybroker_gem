# frozen_string_literal: true

module EasyBroker
  module IntegrationPartners
    class PublicClient
      attr_reader :api_client

      def initialize(api_client)
        @api_client = api_client
      end

      def listing_statuses
        EasyBroker::IntegrationPartners::ListingStatuses.new(api_client)
      end
    end
  end
end
