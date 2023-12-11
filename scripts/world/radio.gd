extends AudioStreamPlayer2D

var broadcastSource: AudioStreamPlayer

func _ready():
	broadcastSource = SoundManager.radioBroadcast
	finished.connect(sync)
#	sync()


func _draw():
	draw_circle_custom(max_distance)
#	draw_circle(position, max_distance, Color(0.0, 0.255, 0.0, 0.2))
	
	
func draw_circle_custom(radius, maxerror = 0.25):
	if radius <= 0.0:
		return

	var maxpoints = 1024 # I think this is renderer limit

	var numpoints = ceil(PI / acos(1.0 - maxerror / radius))
	numpoints = clamp(numpoints, 3, maxpoints)

	var points: Array[Vector2] 

	for i in numpoints:
		var phi = i * PI * 2.0 / numpoints
		var v = Vector2(sin(phi), cos(phi))
		points.push_back(v * radius)

	draw_colored_polygon(points, Color(0.0, 1.0, 0.0, 0.2))


# pass source to sync() so can pick a radio statio, sync target
func sync():
	stream = broadcastSource.currentSong
	play(broadcastSource.currentSongPosition) 
# get copy bradcast playback and stream time 
# add static noise parallel to radio
