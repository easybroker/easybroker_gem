require "test_helper"

module IntegrationPartners
  class AgentsTest < EasyBrokerTestBase
    attr_reader :agents

    def setup
      @agents = EasyBroker::IntegrationPartners::Agents.new(EasyBroker::ApiClient.new)
    end

    def test_find
      stub_verb_request(:get, '/integration_partners/agents/1').
        to_return(body: { id: '1' }.to_json)
      agent = agents.find(1)
      assert_equal '1', agent.id
    end
  end
end
