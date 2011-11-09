class Customer
  attr_accessor :money

  def initialize
    @money = rand(100) +1
  end
end