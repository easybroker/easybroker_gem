# frozen_string_literal: true

class EasyBroker::PublicClient
  attr_reader :api_client

  def initialize(logger: nil)
    @api_client = EasyBroker::ApiClient.new(logger: logger)
  end

  def properties
    EasyBroker::Properties.new(api_client)
  end
end
