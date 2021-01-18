require "test_helper"

class PaginatedResponseTest < EasyBrokerTestBase
  def test_enumerable
    query = mock
    query.expects(:get).returns(mock_response)

    response = EasyBroker::PaginatedResponse.new(query)

    assert_equal 3, response.limit
    assert_equal 6, response.total
    assert_equal 1, response.page

    results = response.to_a
    assert_equal 3, results.size
    assert_equal 1, results[0]
    assert_equal 2, results[1]
    assert_equal 3, results[2]
  end

  def test_find_each
    query = mock
    query.expects(:get).with(nil).returns(mock_response)
    query.expects(:get).with(2).returns(mock_response(2))

    response = EasyBroker::PaginatedResponse.new(query)

    assert_equal 3, response.limit
    assert_equal 6, response.total
    assert_equal 1, response.page

    results = response.find_each.to_a
    assert_equal 6, results.size
    assert_equal 1, results[0]
    assert_equal 6, results[5]
  end

  private

  def mock_response(page = 1)
    start_content = (page - 1) * 3
    OpenStruct.new(
      pagination: mock_pagination(page),
      content: [1 + start_content, 2 + start_content, 3 + start_content]
    )
  end

  def mock_pagination(page = 1)
    OpenStruct.new(
      limit: 3,
      total: 6,
      page: page
    )
  end
end
