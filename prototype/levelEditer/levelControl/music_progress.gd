extends Node2D

var music
var Progress

func _ready() -> void:
	Progress = $Progress

func musicSelected():
	music = $"../../Music"

func _on_progress_update_timeout() -> void:
	var point = int(music.get_playback_position())
	Progress.get_node("SongTimerNow").text = "%02d:%02d" % [point/60, point%60]
	Progress.get_node("SongProgress").value = point
