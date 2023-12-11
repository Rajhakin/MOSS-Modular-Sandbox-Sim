extends Node
class_name SoundPool

var sounds: Array[SoundQueue]
var lastIndex

func _ready():
	for child in get_children():
		if child is SoundQueue:
			sounds.append(child)
			
		
func playRandomSound():
	print("playing")
	var index = randi_range(0, sounds.size() - 1)
	print("rand index: ", index)
	print(lastIndex)
	if index == lastIndex:
		playRandomSound()
		return
	
	lastIndex = index
	sounds[index].playSound()	
		
