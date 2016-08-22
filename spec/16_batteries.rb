require_relative 'spec_helper'

describe Battery do
  before(:each) do
    @battery = Battery.new
  end
    
  it "should be an item" do
    expect(@battery).to be_a Item
  end

  it "#name" do
    expect(@battery.name).to eq("Battery")
  end

  it "#weight" do
    expect(@battery.weight).to eq(25)
  end

  describe "#feed" do 
    before :each do
      @robot = Robot.new
    end

    it "recharges the robot's shields to maximum!" do
      expect(@robot).to receive(:recharge)
      @battery.feed(@robot)
    end
  end
end

describe Robot do 
  before(:each) do
    @robot = Robot.new
    @battery = Battery.new
  end

  # it "should automatically feed battery if shield is below 50" do
  #   allow(@robot).to receive(:shield).and_return(10)
  #   @robot.pick_up(@battery)
  #   expect(@robot.shield).to eq(50)
  # end

  # it "should not auto feed battery if at 50" do
  #   allow(@robot).to receive(:shield).and_return(50)
  #   expect(@battery).not_to receive(:recharge)
  #   @robot.pick_up(@battery)
  # end

  it "should automatically feed batteries if shield below 50" do
    allow(@robot).to receive(:shield).and_return(49)
    expect(@battery).to receive(:feed).and_call_original
    @robot.pick_up(@battery)
  end

  it "should not auto feed box of bolts if at 50" do
    allow(@robot).to receive(:shield).and_return(50)
    expect(@battery).not_to receive(:feed)
    @robot.pick_up(@battery)
  end

end