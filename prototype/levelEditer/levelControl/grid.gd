extends Node2D

var HEIGHT = 100.25
var row_index: int = -1
var GRID
var NoteType
var LINE

func setup(line, r_index: int, value: int):
	LINE = line
	row_index = r_index
	if NoteType == null:
		NoteType = $"../../../../../NoteSelect"
	removeLines()
	addLines(value)

func createSquareStyle(bg_color: Color) -> StyleBoxFlat:
	var style = StyleBoxFlat.new()
	style.bg_color = bg_color
	style.corner_radius_top_left = 0
	style.corner_radius_top_right = 0
	style.corner_radius_bottom_left = 0
	style.corner_radius_bottom_right = 0
	return style

func removeLines():
	for child in get_children():
		child.queue_free()

func addLines(value):
	GRID = 1 if value in [4,8,16,32] else 0

	var cr = ColorRect.new()
	cr.color = Color("ff0000")
	cr.position = Vector2(0,0)
	cr.size = Vector2(60.0,1)
	add_child(cr)

	var buttonHeight = HEIGHT / float(value)
	for num in range(value):
		var button = Button.new()
		var y_pos = round(num * buttonHeight) + 1
		var next_y = round((num + 1) * buttonHeight) + 1
		button.size = Vector2(58.0, next_y - y_pos)
		button.position = Vector2(1.0, y_pos)
		button.set_meta("index", num)

		button.add_theme_stylebox_override("normal", createSquareStyle(Color(0.2,0.2,0.2)))
		button.add_theme_stylebox_override("hover", createSquareStyle(Color(0.3,0.3,0.3)))
		button.add_theme_stylebox_override("pressed", createSquareStyle(Color(0.15,0.15,0.15)))
		button.add_theme_stylebox_override("focus", createSquareStyle(Color(0,0,0,0)))

		button.gui_input.connect(setNote.bind(button))
		add_child(button)

func setNote(event: InputEventMouseButton, button):
	var index = button.get_meta("index")
	var notes = LINE.getNotesFor(row_index)
	if event.button_index == MOUSE_BUTTON_LEFT:
		notes[GRID][index] = NoteType.getNoteType()
	elif event.button_index == MOUSE_BUTTON_RIGHT:
		notes[GRID][index] = null
