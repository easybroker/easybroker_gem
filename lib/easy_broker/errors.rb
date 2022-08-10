module EasyBroker
  class Error < StandardError
    attr_reader :response

    def initialize(message, response)
      @response = response
      super(message)
    end
  end

  class AuthenticationError < Error
    def initialize(response)
      super(response["error"], response)
    end
  end
end
