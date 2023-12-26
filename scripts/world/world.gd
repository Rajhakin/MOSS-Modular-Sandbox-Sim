extends Node2D

""" NOTES
do world handle those helper function, like get angle to, dir, distance between
two world objects or make navigation global?

on deleting agent, delete data?
intercept about to be deleted signal to do something like erasing data
associated to it before actually deleteing it
could have world_obj reference inside world_obj_data
or
make remove_agent func in world
	free obj and it's data?
"""

@export var world_scale: float = 4.0
#region file in disk
@export var default_world_state : Resource
# both are temporary and will loaded from disk, if
#	none then create from default 
#	at least until we have load menu screen working
@export var agents_to_init : Array[AgentData]
@export var locations_to_init : Array[LocationData]
#endregion

@onready var background: Sprite2D = $Background
@onready var regions: Node2D = $Regions
@onready var agents: Node2D = $Agents


func _init() -> void:
	pass


func _ready() -> void:
	scale_world()


func scale_world():
	background.region_rect.size *= world_scale
	
	for region in regions.get_children():
		for location in region.get_children():
			location.position *= world_scale
	
	for agent in agents.get_children():
		agent.position *= world_scale


func spawn_agent(agent_data := AgentData.new()):
	var new_agent = PreLoader.AGENT.instantiate()
	$Agents.add_child(new_agent)
	new_agent.position = agent_data.position
	return new_agent
	

# return agents and locations data, then node that called append to json 
# 	or save in single resource file 
func on_quit():
	pass

