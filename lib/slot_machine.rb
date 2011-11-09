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
    prize_ajustment = rand(100)
    if prize_ajustment == 0
      return 0
    end
    prize_ajustment / 100 + 1
  end
end