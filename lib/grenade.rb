class Grenade < Weapon

  attr_reader :range

  def initialize
    super(name, weight, damage)
    @name = "Grenade"
    @weight = 40
    @damage = 15
    @range = 2
  end

end