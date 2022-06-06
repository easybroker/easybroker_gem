# frozen_string_literal: true

class EasyBroker::Query
  attr_reader :api_client, :endpoint, :query_params
  DEFAULT_PAGE = 1

  def initialize(api_client, endpoint, query_params)
    @api_client = api_client
    @endpoint = endpoint
    @query_params = query_params
  end

  def get(page = nil)
    query_params[:page] = page_param(page)
    response = api_client.get(endpoint, query: query_params)
    JSON.parse(response.body, object_class: OpenStruct)
  end

  private

  def page_param(page)
    page || query_params[:page] || DEFAULT_PAGE
  end
end
