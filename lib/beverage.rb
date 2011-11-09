class Beverage
  attr_accessor :price

  def initialize
    @price = rand(5) + 1
  end
end