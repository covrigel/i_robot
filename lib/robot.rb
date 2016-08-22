class Robot

  MAXIMUM_CAPACITY = 250
  MINIMUM_HEALTH = 0
  MAXIMUM_HEALTH = 100

  attr_reader :position, :items, :health, :attack_power, :x, :y, :shield
  attr_accessor :equipped_weapon

  @@robots = []

  def initialize
    # @position = [0,0]
    @x = 0
    @y = 0
    @items = []
    @health = 100
    @attack_power = 5
    @equipped_weapon
    @shield = 50

    @@robots << self
  end

  def position
    [@x, @y]
  end

  def move_left
    # @position[0] -= 1
    @x -= 1
  end

  def move_right
    # @position[0] += 1
    @x += 1
  end

  def move_up
    # @position[1] += 1
    @y += 1
  end

  def move_down
    # @position[1] -= 1
    @y -= 1
  end

  def pick_up(item)    
    if item.is_a?(Weapon)
      @equipped_weapon = item
    elsif item.is_a?(BoxOfBolts) && needs_healing_with?(item)
      item.feed(self)
    elsif item.is_a?(Battery) && shield < 50
      item.feed(self)
    elsif can_pick_up?(item)
      @items << item
    else
      false
    end
    true
  end

  def items_weight
    current_weight = 0
    @items.each do |x|
      current_weight += x.weight
    end
    current_weight
  end

  def wound(damage_points)
    remaining_damage_points = damage_points - shield
    
    # step 1 damage the shield
    if @shield >= 0
      @shield -= damage_points
      if @shield < 0
        @shield = 0       
      end
    end

    # step 2 take health
    if remaining_damage_points > 0
      @health -= remaining_damage_points
      if @health < MINIMUM_HEALTH
        @health = MINIMUM_HEALTH
      end
    end
  end

  def heal(healing_points)
    @health += healing_points
    if @health > MAXIMUM_HEALTH
      @health = MAXIMUM_HEALTH
    end
  end

  def recharge(recharge_points)
    @shield += recharge_points
    if @shield > 50
      @shield = 50
    end
  end

  def object_nearby?(object)
    (object.x - x).abs <= 1 && (object.y - y).abs <= 1
  end

  def object_two_blocks_away?(object)
    (object.x - x).abs <= 2 && (object.y - y).abs <= 2
  end

  def attack(enemy)   
    if equipped_weapon == nil
      enemy.wound(@attack_power) if object_nearby?(enemy)
    elsif equipped_weapon.is_a? PlasmaCannon
      equipped_weapon.hit(enemy)  
    elsif equipped_weapon.is_a? Laser
      equipped_weapon.hit(enemy) if object_nearby?(enemy)
    elsif equipped_weapon.is_a? Grenade 
      equipped_weapon.hit(enemy) if object_two_blocks_away?(enemy) 
      @equipped_weapon = nil          
    end
  end

  class << self

    def return_position(coord_x, coord_y)
      @@robots.select {|position| position.x == coord_x && position.y == coord_y}
    end

    def robots
      @@robots
    end

    def scan_for(object)
      # make empty list
      # get any robot above, put in list
      # get any robot below, put in list
      # get any robot leftside, put in list
      # get any robot rightside, put in list
      # return list
      objects_nearby = []
      if object.x - self.x <= 1
        objects_nearby << object
      end
      objects_nearby
    end
  end

  private

  def can_pick_up?(item)
    items_weight + item.weight <= MAXIMUM_CAPACITY
  end

  def needs_healing_with?(item)
    health <= (MAXIMUM_HEALTH - item.class::HEALING_POWER)
  end

end

robot1 = Robot.new
robot2 = Robot.new
robot3 = Robot.new
robot3.move_up

puts Robot.robots.count
puts Robot.return_position(0,0)
puts Robot.scan


