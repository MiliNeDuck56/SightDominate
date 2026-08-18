extends Node2D

var HEIGHT = 100.25
var NOTES = {4:[],6:[],8:[],12:[],16:[]}

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
		
		button.add_theme_stylebox_override("normal", createSquareStyle(Color(0.2,0.2,0.2)))
		button.add_theme_stylebox_override("hover", createSquareStyle(Color(0.3,0.3,0.3)))
		button.add_theme_stylebox_override("pressed", createSquareStyle(Color(0.15,0.15,0.15)))
		button.add_theme_stylebox_override("focus", createSquareStyle(Color(0,0,0,0)))
		
		add_child(button)
