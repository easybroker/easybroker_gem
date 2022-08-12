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
      super('Invalid API Key or missing configurations', response)
    end
  end
end
