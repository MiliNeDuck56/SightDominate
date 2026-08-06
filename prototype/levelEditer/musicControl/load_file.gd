extends Node2D

@onready var openFileWindow = $openMusicFile

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	openFileWindow.add_filter("*.wav","audio")

func _on_load_file_pressed() -> void:
	openFileWindow.visible = true

func _on_open_music_file_file_selected(path: String) -> void:
	var fileName = path.get_slice("/",path.get_slice_count("/")-1)
	print(fileName)
	$MusicName.text = fileName
