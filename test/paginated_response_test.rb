require "test_helper"

class PaginatedResponseTest < EasyBrokerTestBase
  def test_enumerable
    query = mock
    query.expects(:get).returns(mock_first_page)

    response = EasyBroker::PaginatedResponse.new(query)

    assert_equal 3, response.limit
    assert_equal 5, response.total
    assert_equal 1, response.page

    results = response.to_a
    assert_equal 3, results.size
    assert_equal 1, results[0]
    assert_equal 2, results[1]
    assert_equal 3, results[2]
  end

  def test_find_each
    query = mock
    query.expects(:get).with(nil).returns(mock_first_page)
    query.expects(:get).with(2).returns(mock_second_page)

    response = EasyBroker::PaginatedResponse.new(query)

    assert_equal 3, response.limit
    assert_equal 5, response.total
    assert_equal 1, response.page

    results = response.find_each.to_a
    assert_equal 5, results.size
    assert_equal 1, results[0]
    assert_equal 2, results[1]
    assert_equal 3, results[2]
    assert_equal 4, results[3]
    assert_equal 5, results[4]
  end

  private

  def mock_first_page
    OpenStruct.new(
      pagination: mock_pagination(1),
      content: [1, 2, 3]
    )
  end

  def mock_second_page
    OpenStruct.new(
      pagination: mock_pagination(2),
      content: [4, 5]
    )
  end

  def mock_pagination(page = 1)
    OpenStruct.new(
      limit: 3,
      total: 5,
      page: page
    )
  end
end
