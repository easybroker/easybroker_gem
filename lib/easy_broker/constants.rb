module EasyBroker
  USER_AGENT = "EasyBroker-%s" % VERSION
  DEFAULT_HEADERS = {
    'Content-Type' => 'application/json',
    'Accept' => 'application/json',
    'User-Agent' => USER_AGENT
  }
  DEFAULT_API_ROOT_URL = 'https://www.easybroker.com'
  AUTHORIZATION_HEADER = 'X-Authorization'
end
