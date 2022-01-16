require "test_helper"

class ContactRequestsTest < EasyBrokerTestBase
  attr_reader :contact_requests

  def setup
    @contact_requests = EasyBroker::ContactRequests.new(EasyBroker::ApiClient.new)
  end

  def test_search
    stub_verb_request(:get, '/contact_requests', query: { page: 1 }).
      to_return(body: mock_search_body.to_json)
    results = contact_requests.search
    assert_equal 1, results.first
  end

  private

  def mock_search_body
    {
      pagination: {
        limit: 3,
        total: 6,
        page: 1
      }, 
      content: [1, 2, 3]
    }
  end
end
