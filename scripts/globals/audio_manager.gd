extends Node

# array of 2dAudioPlayer references so we control them from here

# name/sound map, sound pool or queue
var soundQueueByName: Dictionary
var soundPoolByName: Dictionary

@onready var radio_broadcast = $RadioBroadcast

# why not create pools/queues from streams array? 
#	too much manual work here: one func, one dict entry onready 
#	group preloaded streams of pool type in an array, so we can generate 
#		streamplayers

func _ready() -> void:
	get_files_in_path("res://assets/audio/songs/")			


# since we loading custom songs might as well use same system to load 
#	radio_new_vegas songs, and effects, so we don't need to create 
#	AudioStreamPlayers and update them manually
func load_mp3(path):
	var file = FileAccess.open(path, FileAccess.READ)
	var sound = AudioStreamMP3.new()
	sound.data = file.get_buffer(file.get_length())
	return sound


func get_files_in_path(path):
	var dir = DirAccess.open(path)
	if dir:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			if dir.current_is_dir():
				print("Found directory: " + file_name)
			else:
				print("Found file: " + file_name)
			file_name = dir.get_next()
	else:
		print("An error occurred when trying to access the path.")


# oneshot stream get instanced and freed upon stream completion
func play(stream: AudioStream):
	var new_stream_player = AudioStreamPlayer.new()
	new_stream_player.stream = stream
	new_stream_player.finished.connect(on_stream_player_finished.bind(new_stream_player))
	add_child(new_stream_player)
	new_stream_player.play()


func on_stream_player_finished(stream_player: AudioStreamPlayer):
	stream_player.queue_free()

