require_relative "../lib/casino_app"

describe CasinoApp do
  let :beverage do
    Beverage.new
  end
  let :machine do
    SlotMachine.new
  end
  describe "regarding customers" do
    before do
      @app = CasinoApp.new
      @some_customer = Customer.new "Paul"
      @another_customer = Customer.new "Jane"
      @app.allow_in @some_customer
      @app.allow_in @another_customer
    end
    describe "#allow_in" do
      it "should allow more than one customer to be at the casino" do
        @app.customers.should == [@some_customer, @another_customer]
      end
    end
    describe "#customer_report" do
      it "should list all customers activities" do
        @some_customer.play machine
        @some_customer.drink beverage
        @another_customer.play machine

        @app.customer_report.should == {
                                    "Paul" => {
                                                :total_won  => @some_customer.total_won,
                                                :total_wins => @some_customer.total_wins,
                                                :total_spent => @some_customer.total_spent,
                                              },
                                    "Jane" => {
                                                :total_won => @another_customer.total_won,
                                                :total_wins => @another_customer.total_wins,
                                                :total_spent => @another_customer.total_spent,
                                              },
                                  }

      end
    end
  end
end