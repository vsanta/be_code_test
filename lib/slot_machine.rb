class SlotMachine
  attr_accessor :bet_cost

  def initialize
    @bet_cost = rand(10) +1
  end

  def spin
    @bet_cost * prize_percentage
  end

  private
  def prize_percentage
    prize_adjustment = rand(100)
    if prize_adjustment == 0
      return 0
    end
    prize_adjustment / 100 + 1
  end
end