extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	
func musicSetting(music : AudioStreamWAV):
	var length = music.get_length()
	var total_seconds = int(length)
	
	var MusicProgress = $MusicProgress/Progress
	MusicProgress.get_node("SongTimerEnd").text = "%02d:%02d" % [total_seconds/60, total_seconds%60]
	MusicProgress.get_node("SongProgress").max_value = total_seconds
	$MusicProgress.musicSelected()
	
