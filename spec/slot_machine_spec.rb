require_relative "../lib/slot_machine"

describe SlotMachine do
  it "should have a bet cost" do
    slot_machine = SlotMachine.new
    slot_machine.bet_cost.should > 0
  end
  let :machine do
    slot_machine = SlotMachine.new
    slot_machine.bet_cost = 5.0
    slot_machine
  end
  describe "#spin" do
    context "you loose" do
      it "should return 0" do
        machine.should_receive(:prize_percentage).once.and_return(0)
        machine.spin.should == 0
      end
    end
    context "you win" do
      it "should return prize value" do
        machine.should_receive(:prize_percentage).once.and_return(1.5)
        machine.spin.should == 7.5
      end
    end
  end
end