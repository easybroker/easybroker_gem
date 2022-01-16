module EasyBroker
  USER_AGENT = "EasyBroker-%s" % VERSION
  DEFAULT_HEADERS = {
    'Content-Type' => 'application/json',
    'Accept' => 'application/json',
    'User-Agent' => USER_AGENT
  }
  DEFAULT_API_ROOT_URL = 'https://www.easybroker.com/api/v1'
  STAGING_API_ROOT_URL = 'https://www.stagingeb.com/api/v1'
  AUTHORIZATION_HEADER = 'X-Authorization'
end
