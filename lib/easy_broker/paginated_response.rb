class EasyBroker::PaginatedResponse
  include Enumerable

  attr_reader :query, :response

  def initialize(query)
    @query = query
    @response = query.get
  end

  def total
    pagination&.total
  end

  def limit
    pagination&.limit
  end

  def page
    pagination&.page || 1
  end

  def next_page
    if page * limit < total
      @response = query.get(page + 1)
    end
  end

  def find_each
    return self.to_enum(:find_each) unless block_given?
    loop do
      each do |object|
        yield object
      end
      break unless next_page
    end 
  end

  def each
    return response.content.to_enum(:each) unless block_given?

    response.content.each do |object|
      yield object
    end
  end

  private

  def pagination
    response&.pagination
  end
end
