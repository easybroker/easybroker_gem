class EasyBroker::Configuration
  attr_accessor :api_key, :api_root_url

  def initialize
    @api_key = nil
    @api_root_url = EasyBroker::DEFAULT_API_ROOT_URL
  end
end
