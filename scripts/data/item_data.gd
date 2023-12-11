class_name ItemData
extends Resource

@export var name: String
@export_multiline var description: String
@export_enum("Weapons", "Appareal", "Aid", "Misc", "Ammo") var category: String
@export var texture: Texture
@export var amount: float
@export var value: float

@export_category("Condition")
@export var perishable = false
@export_enum("New", "Normal", "Old", "Delete") var condition: int = 0
@export_range(0, 3) var lifeTime: int = 3
@export_range(0, 3) var decaySpeed: float = 1

# attribute food gives perishable flag/boolean or lifetime variable
#	items that have perishable class might keep track of this, 
#		have code inside it to decrease each second and free itself if reach zero
#		if we have lifetime values as float we could have hundreds of stacks of same
#		item, might be better to have like 3 stages, fresh, normal, rotting
#		same for condition, new, old, ruined, maybe things that don't have 
#		perishability have condition instead, or make it all condition,
#		food condition decays continuously, non food decay with use 
#		with 3 stages might be cheaper to compare creation date with
#		current date and adjust instead of comparing and changing float/int
#		every second, 
#
