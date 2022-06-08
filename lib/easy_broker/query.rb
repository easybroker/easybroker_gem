# frozen_string_literal: true

class EasyBroker::Query
  attr_reader :api_client, :endpoint, :query_params

  def initialize(api_client, endpoint, query_params)
    @api_client = api_client
    @endpoint = endpoint
    @query_params = query_params
  end

  def get(page = nil)
    query_params[:page] = page if page
    response = api_client.get(endpoint, query: query_params)
    JSON.parse(response.body, object_class: OpenStruct)
  end
end
