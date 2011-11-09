class Customer
  attr_accessor :money, :total_spent

  def initialize
    @money = rand(100) +1
    @total_spent = 0
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
    @total_spent += value
  end
end