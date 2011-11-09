require_relative "../lib/customer"

describe Customer do
  it "should have some money" do
    customer = Customer.new
    customer.money.should > 0
  end
end