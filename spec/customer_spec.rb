require_relative "../lib/customer"

describe Customer do
  let :customer do
    customer = Customer.new
    customer.money = 100.0
    customer
  end
  it "should have some money" do
    customer = Customer.new
    customer.money.should > 0.0
  end
  describe "#drink" do
    let :beverage do
      beverage = mock
      beverage.stub(:price) { 5.0 }
      beverage
    end
    it "should use money to pay for drinks" do
      customer.drink beverage
      customer.money.should == 95.0
    end
  end
  describe "#play" do
    let :machine do
      machine = mock
      machine.stub(:bet_cost) { 10.0 }
      machine
    end
    it "should use money to play on the slot machines" do
      customer.play machine
      customer.money.should == 90.0
    end
  end
end