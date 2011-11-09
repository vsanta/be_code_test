require_relative "../lib/beverage"

describe Beverage do
  it "should have price" do
    beverage = Beverage.new
    beverage.price.should > 0
  end
end