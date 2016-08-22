class Battery < Item

  def initialize
    super(name, weight)
    @name = "Battery"
    @weight = 25
  end

  def feed(robot)
    robot.recharge(50)
  end
end