module EasyBroker
  USER_AGENT = "EasyBroker-%s" % VERSION
  DEFAULT_HEADERS = {
    'Content-Type' => 'application/json',
    'Accept' => 'application/json',
    'User-Agent' => USER_AGENT
  }
  DEFAULT_API_ROOT_URL = 'https://api.easybroker.com/v1'
  STAGING_API_ROOT_URL = 'https://api.stagingeb.com/v1'
  AUTHORIZATION_HEADER = 'X-Authorization'
  COUNTRY_CODE_HEADER  = 'Country-Code'
  USE_PARTNER_CODE_HEADER  = 'Use-Partner-Code'
end
