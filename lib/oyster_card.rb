class OysterCard

    attr_reader :balance
    attr_accessor :limit
    DEFAULT_LIMIT = 90

    def initialize
        @balance = 0
        @limit = DEFAULT_LIMIT
    end

    def top_up(value)
        fail "The maximum limit of £#{@limit} is reached" if full?
        @balance += value
    end

    def full?
      @balance >= @limit
    end

    def deduct(value)
      @balance -= value
    end
end