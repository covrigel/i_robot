require_relative 'spec_helper'

describe Robot do 
  before :each do 
    @robot = Robot.new
  end

  describe "#shield" do 
    it "should be 50" do
      expect(@robot.shield).to eq(50)
    end
  end

  describe "#wound" do
    it "decreases shield" do
      @robot.wound(20)
      expect(@robot.shield).to eq(30)
      expect(@robot.health).to eq(100)
    end

    it "decreases shield before health is affected" do
      @robot.wound(50)
      expect(@robot.shield).to eq(0)
      expect(@robot.health).to eq(100)
    end

    it "decreases health after shields are out" do
      @robot.wound(100)
      expect(@robot.shield).to eq(0)
      expect(@robot.health).to eq(50)
    end
  end

end