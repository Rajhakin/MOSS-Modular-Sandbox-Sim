class_name SoundQueue
extends Node2D


@export var stream: AudioStream
@export var streamPlayers: int = 1

var next: int = 0


func _ready():
	for i in range(streamPlayers):
		var newAudioStreamPlayer = AudioStreamPlayer2D.new()
		newAudioStreamPlayer.stream = stream
		add_child(newAudioStreamPlayer)


#func playSound():
#	if (audioStreamPlayers[next].playing == false):
#		audioStreamPlayers[next].play()
#		next += 1
#		next %= audioStreamPlayers.size()

		

