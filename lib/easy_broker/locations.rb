# frozen_string_literal: true

class EasyBroker::Locations
  ENDPOINT = '/locations'

  attr_reader :api_client

  def initialize(api_client)
    @api_client = api_client
  end

  def find(name = nil)
    query = { query: name }.compact
    response = api_client.get(ENDPOINT, query: query)
    JSON.parse(response.body, object_class: OpenStruct)
  end
end
