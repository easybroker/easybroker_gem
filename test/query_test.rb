require "test_helper"

class QueryTest < Minitest::Test
  def test_get
    client = mock
    client.expects(:get).with('test', query: { a: 2, page: 3 }).returns(mock_response)
    query = EasyBroker::Query.new(client, 'test', { a: 2, page: 3 })
    results = query.get
    assert_equal results.a, 1
    assert_equal results.b, 2
  end

  def test_get_with_page_param
    client = mock
    client.expects(:get).with('test', query: { a: 2, page: 2 }).returns(mock_response)
    query = EasyBroker::Query.new(client, 'test', { a: 2 })
    results = query.get(2)
    assert_equal results.a, 1
    assert_equal results.b, 2
  end

  def mock_response
    stub(body: { a: 1, b: 2 }.to_json)
  end
end
