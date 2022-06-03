require 'httparty'

require 'easy_broker/version'
require 'easy_broker/constants'
require 'easy_broker/errors'
require 'easy_broker/configuration'
require 'easy_broker/api_client'
require 'easy_broker/public_client'
require 'easy_broker/paginated_response'
require 'easy_broker/query'
require 'easy_broker/properties'
require 'easy_broker/mls_properties'
require 'easy_broker/contact_requests'
require 'easy_broker/locations'
require 'easy_broker/listing_statuses'
require 'easy_broker/integration_partners/public_client'
require 'easy_broker/integration_partners/agencies'
require 'easy_broker/integration_partners/agents'
require 'easy_broker/integration_partners/listing_statuses'
require 'easy_broker/integration_partners/properties'

module EasyBroker
  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield(configuration)
  end

  def self.api_client(logger: nil)
    EasyBroker::ApiClient.new(logger: logger)
  end

  def self.client(logger: nil)
    EasyBroker::PublicClient.new(logger: logger)
  end
end
