extends Node

enum{STRING,INTEGER,FLOAT,VECTOR,BOOL,NULL}

var target
var selection=[]
var commands={
'Restart':[NULL],
'Quit':[NULL],
'Start':[STRING],
'End':[STRING],
'Spawn':[STRING,INTEGER],
'Hijack':[NULL],
'Return':[NULL],
'Move':[VECTOR],
'Add':[STRING,INTEGER],
'Remove':[STRING,INTEGER],
'Hit':[NULL],
'Heal':[NULL],
'Damage':[NULL],
'Kill':[NULL],
'Resurect':[NULL],
'Destroy':[NULL]
	}

func process_string(string):
	var words=Array(string.split(' ',false))
	if words.size():
		var command=words.pop_front()
		for c in commands:
			if c == command:
				print("exist")
				if words.size() != commands[c].size():
					return 'Invalid Argument'
				for a in range(words.size()):
					if !CheckType(words[a],c[a]):
						return 'Invalid Argument'
				print("valid")
				callv(command,words)
				return string
	
	return 'Invalid Command'
			
func CheckType(argument,expected):
	match expected:
		STRING:
			return true
		INTEGER:
			return argument.is_valid_integer()
		FLOAT:
			return argument.is_valid_float()
		VECTOR:
			return (argument-argument==Vector2.ZERO or false)
		BOOL:
			return (argument=='true' or argument=='false')#is bool?
		NULL:
			return true
	
func Restart():
	get_tree().reload_current_scene()
	
func Quit():
	get_tree().quit()
	
func Start(_event):
	pass
	
func End(_event):
	pass

func Spawn(_object,_number):
#	print("Spawning")
#	for i in _number:
#		match _object:
#			"camera":
#				var camera = Camera2D.new()
#				camera.zoom = Vector2.ONE * 0.5
#				camera.current = true
#				Event.emit_signal("objectSummoned", _object)
	pass
	
	
func Hijack():
	target.conscious=true
	
func Return():
	target.conscious=false
		
func Move(newPosition=target.get_global_mouse_position()):
	target.position=newPosition
	
func Add(_item,_number):
	pass
	
func Remove(_item,_number):
	pass
	
func Hit(_weapon,_ammo,_times):
	pass
	
func Heal(_amount):
	pass
	
func Damage(_amount):
	pass
	
func Kill():
	pass
	
func Resurect():
	pass
	
func Destroy():
	if selection.size():
		for selected in selection:
			queue_free()
	else:
		if target:
			target.queue_free()

######################################################################################

func ObjectClicked(object):
	target=object
	
func GetObjData():
	pass
	
func Pause(): # toggle_pause
	get_tree().paused =! get_tree().paused

func Set(propety,value):
	if target:
		set(target.get(propety),value)
		
