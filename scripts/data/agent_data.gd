class_name AgentData
extends Resource

static var instanced_agents := -1

#region CARAVAN
@export var name : String
@export var items : Array[ItemData]

var id

var position := Vector2.ZERO
var rotation := 0.0

var current_status = Enums.AgentStatus.DISABLED
# will be slowest party member speed, caravan sprite could be slowest unit sprite
#endregion

#region NAVIGATION
var current_task
# MOVEMENT
# for agents to know if reached place,
#	might also be useful for follow behavior in user_agent
var current_target# destination?
# user_agent will only have one element in array at any given time
# position and angle/rotation array to function as agent path?
var current_path# waypoints
# we have no acceleration for now, might add later to imply time party take 
# 	to shuffle/reorganize before facing new direction 
#endregion



func _init() -> void:
	instanced_agents += 1
	id = instanced_agents
	if not name:
		name = "Agent #%03s" % instanced_agents
	print("instanced_agents: ", instanced_agents)
