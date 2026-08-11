extends AudioStreamPlayer

var musicPoint = 0

func _ready() -> void:
	var MusicProgress = $"../LevelEdit/MusicProgress/Buttons"
	
	MusicProgress.get_node("Play").button_down.connect(MusicPlayButtonDown)
	MusicProgress.get_node("Pause").button_down.connect(MusicPauseButtonDown)
	MusicProgress.get_node("Stop").button_down.connect(MusicStopButtonDown)

func MusicPlayButtonDown(): 
	self.play(musicPoint)
	
func MusicPauseButtonDown():
	musicPoint = self.get_playback_position()
	self.stop()
	
func MusicStopButtonDown(): 
	musicPoint = 0
	self.stop()
