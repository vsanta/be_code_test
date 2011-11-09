class Customer
  attr_accessor :money

  def initialize
    @money = rand(100) +1
  end

  def drink beverage
    spend  beverage.price
  end

  def play machine
    spend machine.bet_cost
    @money += machine.spin
  end

  private
  def spend value
    @money = @money - value
  end
end