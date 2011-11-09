class Customer
  attr_accessor :money

  def initialize
    @money = rand(100) +1
  end

  def drink beverage
    @money = @money - beverage.price
  end

  def play machine
    @money = @money - machine.bet_cost
  end
end