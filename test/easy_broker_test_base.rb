class EasyBrokerTestBase < Minitest::Test
  def stub_verb_request(verb, path, params = {})
    params[:query] = query = params[:query] || {}
    params[:headers] = EasyBroker::DEFAULT_HEADERS
    url = [EasyBroker::DEFAULT_API_ROOT_URL, path].join
    stub_request(verb, url).with(params)
  end
end