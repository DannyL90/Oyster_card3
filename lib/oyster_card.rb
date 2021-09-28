class OysterCard

    attr_reader :balance, :in_use
    attr_accessor :limit
    DEFAULT_LIMIT = 90
    MINIMUM_FARE = 1

    def initialize
        @balance = 0
				@in_use = false
        @limit = DEFAULT_LIMIT
        @minimum_fare = MINIMUM_FARE
    end

    def top_up(value)
        fail "The maximum limit of £#{@limit} is reached" if full?
        @balance += value
    end

    def full?
      @balance >= @limit
    end

    def touch_in
      fail "Not enough fund" if @balance < @minimum_fare
		  @in_use = true
    end

	  def touch_out
			deduct(MINIMUM_FARE)
		  @in_use = false
    end

	  def in_journey?
		  @in_use
	  end

		private

		def deduct(value)
      @balance -= value
    end
end