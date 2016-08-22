class BoxOfBolts < Item

  HEALING_POWER = 20

  def initialize
    super(name, weight)
    @name = "Box of bolts"
    @weight = 25
  end

  

  def feed(robot) 
    robot.heal(HEALING_POWER)
  end
end