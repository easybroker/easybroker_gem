# frozen_string_literal: true

class EasyBroker::ApiClient
  include HTTParty
  
  format :json

  attr_reader :logger

  def initialize(logger: nil)
    self.class.base_uri EasyBroker.configuration.api_root_url
    self.class.headers EasyBroker::DEFAULT_HEADERS.merge(
      EasyBroker::AUTHORIZATION_HEADER => EasyBroker.configuration.api_key
    )
    @logger = logger
  end

  def get(path, query: {})
    send_request(:get, path, query: query)
  end

  def post(path, query: {}, body: {})
    send_request(:post, path, query: query, body: body)
  end

  def put(path, query: {}, body: {})
    send_request(:put, path, query: query, body: body)
  end

  def delete(path, query: {})
    send_request(:delete, path, query: query)
  end

  private

  def send_request(verb, path = '', params = {})
    self.class.send(verb, path, params).tap do |response|
      check_errors(response)
      logger&.log response
    end
  end

  def check_errors(response)
    raise EasyBroker::AuthenticationError.new(response) if response.code == 401
  end
end
