require "test_helper"

module IntegrationPartners
  class ListingStatusesTest < EasyBrokerTestBase
    attr_reader :statuses

    def setup
      @statuses = EasyBroker::IntegrationPartners::ListingStatuses.new(EasyBroker::ApiClient.new)
    end

    def test_search
      stub_verb_request(:get, '/integration_partners/listing_statuses', query: { page: 1 }).
        to_return(body: mock_search_body.to_json)
      results = statuses.search
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
