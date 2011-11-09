class Customer
  attr_accessor :money, :total_spent, :total_won, :total_wins, :name

  def initialize name
    @money = rand(100) +1
    @total_spent = 0
    @total_won = 0
    @total_wins = 0
    @name = name
  end

  def drink beverage
    spend  beverage.price
  end

  def play machine
    spend machine.bet_cost
    handle_prize machine.spin
  end

  private
  def spend value
    @money = @money - value
    @total_spent += value
  end
  def handle_prize prize
    @money += prize
    @total_won += prize
    @total_wins += 1 if prize > 0
  end
end