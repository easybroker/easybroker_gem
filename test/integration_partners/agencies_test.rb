require "test_helper"

module IntegrationPartners
  class AgenciesTest < EasyBrokerTestBase
    attr_reader :agencies

    def setup
      @agencies = EasyBroker::IntegrationPartners::Agencies.new(EasyBroker::ApiClient.new)
    end

    def test_find
      stub_verb_request(:get, '/integration_partners/agencies/1').
        to_return(body: { id: '1' }.to_json)
      agency = agencies.find(1)
      assert_equal '1', agency.id
    end

    def test_search
      stub_verb_request(:get, '/integration_partners/agencies').
        to_return(body: mock_search_body.to_json)
      results = agencies.search
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
end
