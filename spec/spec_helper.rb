require 'rspec'

# Include debugging tools by default so that you don't have to add them.
require 'pry'
require 'byebug'

# Tool for safely requiring files that might not exist yet.
def safe_require(file)
  require file
rescue LoadError
  # ignore
end

# Safely require the files that are expected to be created.
safe_require 'robot'
safe_require 'item'
safe_require 'weapon'
safe_require 'box_of_bolts'
safe_require 'laser'
safe_require 'plasma_cannon'
safe_require 'grenade'
safe_require 'battery'

# ########### 17 - Robot list ##############

# The Robot class should keep track of all robots that are instantiated.

# ########### 18 - Robot.in_position(x, y) ##############

# The Robot class can be asked to return all robots in a given position (x,y). 
# It should return an array of all the robots since multiple robots could potentially be at 
# position 0,0 (for example)

# Robot.class_variable_set(:@@robots, [])

# ############ 19 - Scanning ##############

# A given robot should be able to scan its surroundings (tiles immediately next to its current `@position`)
# Note: You should leverage the class method implemented in #18

# ########## 20 - Special Weapon (Bonus) #############

# Introduce the concept of a special weapon which is like a grenade but with a range of 1. 
# However, in addition to being targetted at a specific robot, this one-time use weapon damages 
# all robots surrounding the target. Its damage goes straight through shields (if you implemented 
# shields) and directly reduces their health by 30 points.




