require "test_helper"

class QueryTest < Minitest::Test
  def test_get
    client = mock
    client.expects(:get).with('test', query: { a: 2, page: 1 }).returns(mock_response)

    query = EasyBroker::Query.new(client, 'test', { a: 2 })
    results = query.get
    assert_equal results.a, 1
    assert_equal results.b, 2

    client.expects(:get).with('test', query: { a: 2, page: 2 }).returns(mock_response)
    query.get(2)
  end

  def mock_response
    stub(body: { a: 1, b: 2 }.to_json)
  end
end
