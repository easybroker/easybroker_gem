# frozen_string_literal: true

class EasyBroker::Properties
  ENDPOINT = '/properties'

  attr_reader :api_client

  def initialize(api_client)
    @api_client = api_client
  end

  def find(public_id)
    response = api_client.get("#{ENDPOINT}/#{public_id}") 
    JSON.parse(response.body, object_class: OpenStruct)
  end

  def search(query = {})
    stored_query = EasyBroker::Query.new(api_client, ENDPOINT, query)
    EasyBroker::PaginatedResponse.new(stored_query)
  end
end
