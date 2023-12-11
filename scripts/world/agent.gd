extends Area2D
class_name Agent

"""
target, movement code, overlap signal

do we keep data inside world object? or all data arrays 
	item are data, don't need to be physically with entity to belong to them
	we should be able to erase objects while keeping it's data safe 
	might be easier to access and compare data if it's all in one place

 intercept about to be deleted signal to do something like erasing data
 associated to it before actually deleteing it

should game pause? due to time scale it makes sense, else it the time it takes
 	to make deal 3 days have passed and both agents resource would drain out

 position and angle array to function as agent path?

use groups, can get useragent from group, since user agent will be a generic agent

navigation global?

speed limited by slowest unit speed, sprite could be slowest unit sprite
"""


signal target_reached

@export var agent_data: AgentData
@export_group("Movement")
@export var linear_speed: float = 150
@export var angular_speed: float = 2.0944#120 degrees
@export_group("","")

# INPUT
var input_dir = Vector2.ZERO
var current_target
var current_path#waypoints
# MOVEMENT
var linear_velocity = Vector2.ZERO
var facing_dir = 0.0


func  _ready():
	area_entered.connect(_on_area_entered)


func _on_area_entered(area):
	if (area is Agent) or (area is Location):
		# do they have any bussiness togheter? if not ignore
		if area == current_target:
			target_reached.emit()
		
