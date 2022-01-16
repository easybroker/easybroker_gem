# frozen_string_literal: true

class EasyBroker::Locations
  ENDPOINT = '/locations'

  attr_reader :api_client

  def initialize(api_client)
    @api_client = api_client
  end

  def search(query = {})
    stored_query = EasyBroker::Query.new(api_client, ENDPOINT, query)
    EasyBroker::PaginatedResponse.new(stored_query)
  end
end
