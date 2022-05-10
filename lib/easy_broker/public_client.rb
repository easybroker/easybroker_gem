# frozen_string_literal: true

class EasyBroker::PublicClient
  attr_reader :api_client

  def initialize(logger: nil)
    @api_client = EasyBroker::ApiClient.new(logger: logger)
  end

  def properties
    EasyBroker::Properties.new(api_client)
  end

  def mls_properties
    EasyBroker::MlsProperties.new(api_client)
  end

  def contact_requests
    EasyBroker::ContactRequests.new(api_client)
  end

  def locations
    EasyBroker::Locations.new(api_client)
  end

  def listing_statuses
    EasyBroker::ListingStatuses.new(api_client)
  end
end
