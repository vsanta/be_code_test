require_relative "../lib/customer"

describe Customer do
  it "should have some money" do
    customer = Customer.new
    customer.money.should > 0.0
  end
  let :customer do
    customer = Customer.new
    customer.money = 100.0
    customer
  end
  let :machine do
    machine = mock
    machine.stub(:bet_cost) { 10.0 }
    machine
  end
  let :beverage do
    beverage = mock
    beverage.stub(:price) { 5.0 }
    beverage
  end
  describe "#drink" do
    it "should use money to pay for drinks" do
      customer.drink beverage
      customer.money.should == 95.0
    end
  end
  describe "#play" do
    it "should use money to play on the slot machines" do
      machine.stub(:spin) { 0.0 }
      customer.play machine
      customer.money.should == 90.0
    end
    context "customer wins" do
      it "should have prize value credited" do
        machine.stub(:spin) { 20.0 }
        customer.play machine
        customer.money.should == 110.0
      end
    end
  end
  describe "#total_spent" do
    it "should return how much customer spent" do
      machine.stub(:spin) { 20.0 }
      customer.drink beverage
      customer.play machine
      customer.total_spent.should == 15.0
    end
  end
  describe "#total_won" do
    it "should return how much customer won" do
      machine.stub(:spin) { 20.0 }
      customer.drink beverage
      customer.play machine
      customer.play machine
      customer.total_won.should == 40.0
    end
  end
end