class EasyBroker::Configuration
  attr_accessor :api_key, :api_root_url, :country_code, :use_partner_code

  def initialize
    @api_key = nil
    @country_code = nil
    @use_partner_code = nil
    @api_root_url = EasyBroker::DEFAULT_API_ROOT_URL
  end
end
