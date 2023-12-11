extends AudioStreamPlayer


const SONG_INTROS = [
 "res://SFX/NPC/Mr New Vegas/radionewve_rnvmusicintroge_0014dfc5_1.ogg",
 "res://SFX/NPC/Mr New Vegas/radionewve_rnvmusicintroge_0014dfc6_1.ogg",
 "res://SFX/NPC/Mr New Vegas/radionewve_rnvmusicintroge_0014dfc7_1.ogg",
 "res://SFX/NPC/Mr New Vegas/radionewve_rnvmusicintroge_0014eb1a_1.ogg",
 "res://SFX/NPC/Mr New Vegas/radionewve_rnvmusicintroge_0014eb1b_1.ogg",
 "res://SFX/NPC/Mr New Vegas/radionewve_rnvmusicintroge_0014eb1c_1.ogg",
 "res://SFX/NPC/Mr New Vegas/radionewve_rnvmusicintroge_0014eb1d_1.ogg",
 "res://SFX/NPC/Mr New Vegas/radionewve_rnvmusicintroge_0014eb1e_1.ogg",
 "res://SFX/NPC/Mr New Vegas/radionewve_rnvmusicintroge_0014eb1f_1.ogg",
 "res://SFX/NPC/Mr New Vegas/radionewve_rnvmusicintroge_0014eb17_1.ogg",
 "res://SFX/NPC/Mr New Vegas/radionewve_rnvmusicintroge_0014eb18_1.ogg",
 "res://SFX/NPC/Mr New Vegas/radionewve_rnvmusicintroge_0014eb19_1.ogg"
]
	
const SONG_OUTROS = [
 "res://SFX/NPC/Mr New Vegas/radionewvegas_radiohello_0014dfc8_1.ogg",
 "res://SFX/NPC/Mr New Vegas/radionewvegas_radiohello_0014dfc9_1.ogg",
 "res://SFX/NPC/Mr New Vegas/radionewvegas_radiohello_0014dfca_1.ogg",
 "res://SFX/NPC/Mr New Vegas/radionewvegas_radiohello_0014dfcb_1.ogg",
 "res://SFX/NPC/Mr New Vegas/radionewvegas_radiohello_0014dfcc_1.ogg",
 "res://SFX/NPC/Mr New Vegas/radionewvegas_radiohello_0014dfcd_1.ogg",
 "res://SFX/NPC/Mr New Vegas/radionewvegas_radiohello_0014dfce_1.ogg",
 "res://SFX/NPC/Mr New Vegas/radionewvegas_radiohello_0014dfcf_1.ogg",
 "res://SFX/NPC/Mr New Vegas/radionewvegas_radiohello_0014dfd0_1.ogg",
 "res://SFX/NPC/Mr New Vegas/radionewvegas_radiohello_0014dfd1_1.ogg",
 "res://SFX/NPC/Mr New Vegas/radionewvegas_radiohello_0014f11b_1.ogg",
 "res://SFX/NPC/Mr New Vegas/radionewvegas_radiohello_0014f11c_1.ogg",
 "res://SFX/NPC/Mr New Vegas/radionewvegas_radiohello_0014f11d_1.ogg",
 "res://SFX/NPC/Mr New Vegas/radionewvegas_radiohello_0014f11e_1.ogg",
 "res://SFX/NPC/Mr New Vegas/radionewvegas_radiohello_0014f11f_1.ogg"	
]

const NEWS_INTROS = [
 "res://SFX/NPC/Mr New Vegas/radionewvegas_rnvnewsintro_0014dfb7_1.ogg",
 "res://SFX/NPC/Mr New Vegas/radionewvegas_rnvnewsintro_0014dfb8_1.ogg",
 "res://SFX/NPC/Mr New Vegas/radionewvegas_rnvnewsintro_0014dfb9_1.ogg",
 "res://SFX/NPC/Mr New Vegas/radionewvegas_rnvnewsintro_0014e301_1.ogg",
 "res://SFX/NPC/Mr New Vegas/radionewvegas_rnvnewsintro_0014e302_1.ogg",
 "res://SFX/NPC/Mr New Vegas/radionewvegas_rnvnewsintro_0014eb2f_1.ogg",
 "res://SFX/NPC/Mr New Vegas/radionewvegas_rnvnewsintro_0014eb30_1.ogg",
 "res://SFX/NPC/Mr New Vegas/radionewvegas_rnvnewsintro_0014eb31_1.ogg",
 "res://SFX/NPC/Mr New Vegas/radionewvegas_rnvnewsintro_0014eb32_1.ogg",
 "res://SFX/NPC/Mr New Vegas/radionewvegas_rnvnewsintro_0014eb33_1.ogg",
 "res://SFX/NPC/Mr New Vegas/radionewvegas_rnvnewsintro_0014eb34_1.ogg"
]
	
const NEWS_STORIES = [
]

const NEWS_TRANSITIONS = [
 "res://SFX/NPC/Mr New Vegas/radionewve_rnvnewstransiti_0014e2fb_1.ogg",
 "res://SFX/NPC/Mr New Vegas/radionewve_rnvnewstransiti_0014e2fc_1.ogg",
 "res://SFX/NPC/Mr New Vegas/radionewve_rnvnewstransiti_0014e2fd_1.ogg",
 "res://SFX/NPC/Mr New Vegas/radionewve_rnvnewstransiti_0014e2fe_1.ogg",
 "res://SFX/NPC/Mr New Vegas/radionewve_rnvnewstransiti_0014e2ff_1.ogg",
 "res://SFX/NPC/Mr New Vegas/radionewve_rnvnewstransiti_0014e300_1.ogg"
]

const NEWS_OUTROS = [
 "res://SFX/NPC/Mr New Vegas/radionewvegas_rnvnewspost_0014dfc2_1.ogg",
 "res://SFX/NPC/Mr New Vegas/radionewvegas_rnvnewspost_0014dfc3_1.ogg",
 "res://SFX/NPC/Mr New Vegas/radionewvegas_rnvnewspost_0014dfc4_1.ogg",
 "res://SFX/NPC/Mr New Vegas/radionewvegas_rnvnewspost_0014eb2a_1.ogg",
 "res://SFX/NPC/Mr New Vegas/radionewvegas_rnvnewspost_0014eb2b_1.ogg",
 "res://SFX/NPC/Mr New Vegas/radionewvegas_rnvnewspost_0014eb2c_1.ogg",
 "res://SFX/NPC/Mr New Vegas/radionewvegas_rnvnewspost_0014eb2d_1.ogg",
 "res://SFX/NPC/Mr New Vegas/radionewvegas_rnvnewspost_0014eb20_1.ogg",
 "res://SFX/NPC/Mr New Vegas/radionewvegas_rnvnewspost_0014eb21_1.ogg",
 "res://SFX/NPC/Mr New Vegas/radionewvegas_rnvnewspost_0014eb22_1.ogg",
 "res://SFX/NPC/Mr New Vegas/radionewvegas_rnvnewspost_0014eb23_1.ogg",
 "res://SFX/NPC/Mr New Vegas/radionewvegas_rnvnewspost_0014eb24_1.ogg",
 "res://SFX/NPC/Mr New Vegas/radionewvegas_rnvnewspost_0014eb25_1.ogg",
 "res://SFX/NPC/Mr New Vegas/radionewvegas_rnvnewspost_0014eb26_1.ogg",
 "res://SFX/NPC/Mr New Vegas/radionewvegas_rnvnewspost_0014eb27_1.ogg",
 "res://SFX/NPC/Mr New Vegas/radionewvegas_rnvnewspost_0014eb28_1.ogg",
 "res://SFX/NPC/Mr New Vegas/radionewvegas_rnvnewspost_0014eb29_1.ogg",
 "res://SFX/NPC/Mr New Vegas/radionewvegas_rnvnewspost_0014f161_1.ogg",
 "res://SFX/NPC/Mr New Vegas/radionewvegas_rnvnewspost_0014f162_1.ogg"
]

const SPECIAL_SONG_INTROS: Dictionary = {
 "res://SFX/Songs/Radio New Vegas/Frank Sinatra-Blue_Moon.mp3":
 "res://SFX/NPC/Mr New Vegas/radionewve_rnvmusicintrosp_0014f120_1.ogg",
 "res://SFX/Songs/Radio New Vegas/Dean Martin-Aint That A Kick In the Head.mp3":
 "res://SFX/NPC/Mr New Vegas/radionewve_rnvmusicintrosp_0014f121_1.ogg",
 "res://SFX/Songs/Radio New Vegas/Johnny Mercer-Somethings Gotta Give.mp3":
 "res://SFX/NPC/Mr New Vegas/radionewve_rnvmusicintrosp_0014f122_1.ogg",
 "res://SFX/Songs/Radio New Vegas/The Ink Spots-It's as sin to telL Lie.mp3":
 "res://SFX/NPC/Mr New Vegas/radionewve_rnvmusicintrosp_0014f123_1.ogg",
 "res://SFX/Songs/Radio New Vegas/Nat King Cole-Love Me as Though no Tomorrow.mp3":
 "res://SFX/NPC/Mr New Vegas/radionewve_rnvmusicintrosp_0014f125_1.ogg",
 "res://SFX/Songs/Radio New Vegas/Peggy Sue-Johnny_Guitar.mp3":
 "res://SFX/NPC/Mr New Vegas/radionewve_rnvmusicintrosp_0014f126_1.ogg",
 "res://SFX/Songs/Radio New Vegas/Harland Howard-Heartaches by the Number.mp3":
 "res://SFX/NPC/Mr New Vegas/radionewve_rnvmusicintrosp_0014f127_1.ogg",
 "res://SFX/Songs/Radio New Vegas/Helen Forrest-Mad About The Boy.mp3":
 "res://SFX/NPC/Mr New Vegas/radionewve_rnvmusicintrosp_0014f128_1.ogg",
 "res://SFX/Songs/Radio New Vegas/Kay Kyser-Jingle Jangle Jingle.mp3":
 "res://SFX/NPC/Mr New Vegas/radionewve_rnvmusicintrosp_0014f129_1.ogg",
}

const SONGS = [
# RADIO NEW VEGAS - INTRO
 "res://SFX/Songs/Radio New Vegas/Frank Sinatra-Blue_Moon.mp3", 
 "res://SFX/Songs/Radio New Vegas/Dean Martin-Aint That A Kick In the Head.mp3",
 "res://SFX/Songs/Radio New Vegas/Johnny Mercer-Somethings Gotta Give.mp3", 
 "res://SFX/Songs/Radio New Vegas/The Ink Spots-It's as sin to telL Lie.mp3",
 "res://SFX/Songs/Radio New Vegas/Nat King Cole-Love Me as Though no Tomorrow.mp3",
 "res://SFX/Songs/Radio New Vegas/Peggy Sue-Johnny_Guitar.mp3", 
 "res://SFX/Songs/Radio New Vegas/Harland Howard-Heartaches by the Number.mp3",
 "res://SFX/Songs/Radio New Vegas/Helen Forrest-Mad About The Boy.mp3", 
 "res://SFX/Songs/Radio New Vegas/Kay Kyser-Jingle Jangle Jingle.mp3", 
# RADIO NEW VEGAS - NO INTRO
 "res://SFX/Songs/Radio New Vegas/Kathy Mathia-Where Have You Been All My Life.mp3",
 "res://SFX/Songs/Radio New Vegas/Marty Robbins-Big Iron.mp3", 
 "res://SFX/Songs/Radio New Vegas/Peggy Sue-Why Don't You Do It Right.mp3", 
 "res://SFX/Songs/Radio New Vegas/Pete Thomas-Sit and Dream.mp3", 

 "res://SFX/Songs/Radio New Vegas/Gerhard Trede-American Swing.mp3", 
 "res://SFX/Songs/Radio New Vegas/Gerhard Trede-Hallo Mister X.mp3", 
 "res://SFX/Songs/Radio New Vegas/Gerhard Trede-Manhattan.mp3", 
 "res://SFX/Songs/Radio New Vegas/gerhard Trede-Slow Bounce.mp3", 
 "res://SFX/Songs/Radio New Vegas/Gerhard Trede-Strahlende Trompete.mp3",
 "res://SFX/Songs/Radio New Vegas/Gerhard Trede-von Spanien Nach Südamerika.mp3",
# MOJAVE MUSIC
 "res://SFX/Songs/Mojave Music/Bert Weedon-Happy Times.mp3",
 "res://SFX/Songs/Mojave Music/Bert Weedon-Lazy Day Blues.mp3",
 "res://SFX/Songs/Mojave Music/Bert Weedon-Roundhouse Rock.mp3",
 "res://SFX/Songs/Mojave Music/Darrell Warne Perry & Tommy Smith-Goin_Under.mp3",
 "res://SFX/Songs/Mojave Music/Harland Howard-Heartaches by the Number.mp3",
 "res://SFX/Songs/Mojave Music/Johnny Bond-Stars of the Midnight Range.mp3",
 "res://SFX/Songs/Mojave Music/Katie Thompson-I'm so Blue.mp3",
 "res://SFX/Songs/Mojave Music/Lost Weekend Western Swing Band-Let's Ride Into the Sunset Together.mp3",
 "res://SFX/Songs/Mojave Music/Lost Weekend Western Swing Band-Lone_Star.mp3",
 "res://SFX/Songs/Mojave Music/Lost Weekend Western Swing Bang-In the Shadow of the Valley.mp3",
 "res://SFX/Songs/Mojave Music/The Roues Brothers-I'm Movin Out.mp3",
# CUSTOM MUSIC
 "res://SFX/Songs/Custom/The Jubalaires   Noah.mp3"
]


@export_range(0.1, 1.0, 0.01) var intro_frequency: float = 0.5

var cached_song
var last_song# to check for repeat
var current_song
var current_song_duration
var current_song_position


func _ready():
	finished.connect(on_stream_finished)
	# set a current song to initialize loop, 
	#	 TODO: radio has no stopped stated, brakes if theres no valid stream set
	set_next_stream()


# if song finished pick new one, else 
func _process(delta):
	if current_song_position >= current_song_duration:
		set_next_stream()
	else:
		current_song_position += delta


# change playback
func set_next_stream():
	var next_stream: String
	
	# if a song is cached play cached song, else get a random song
	if cached_song:
		next_stream = cached_song
		cached_song = null
	else:
		next_stream = SONGS.pick_random()	
		print("next song: ", next_stream.get_file())
	
		# roll to check if play intro before song or not 
			# if true, cache song for later and play an intro instead
		if randf_range(0.0, 1.0) <= intro_frequency:	
			cached_song = next_stream
			
			if next_stream in SPECIAL_SONG_INTROS: 
				next_stream = SPECIAL_SONG_INTROS[next_stream]
			else:
				next_stream = SONG_INTROS.pick_random()
	
	
	current_song = load(next_stream)
	current_song_duration = current_song.get_length()
	current_song_position = 0
				
			
# sync with broadcast by getting current playing song and it's current position
func on_stream_finished():
	stream = current_song
	play(current_song_position) 

