extends Node2D

var lineNum
var lines
var activate_lines = Array()

func _ready() -> void:
	lines = get_node("Lines").get_children()
	lineNum = 2
	areaMoving()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("MoveAreaLeft"): moveAreaLeft()
	elif Input.is_action_just_pressed("MoveAreaRight"): moveAreaRight()
	
	if Input.is_action_just_pressed("InputLine1"): activate_lines[0].keyPressed()
	if Input.is_action_just_pressed("InputLine2"): activate_lines[1].keyPressed()
	if Input.is_action_just_pressed("InputLine3"): activate_lines[2].keyPressed()
	if Input.is_action_just_pressed("InputLine4"): activate_lines[3].keyPressed()

func moveAreaLeft():
	if(lineNum > 0):
		lineNum -= 1
		areaMoving()
func moveAreaRight():
	if(lineNum < 4):
		lineNum += 1
		areaMoving()
func areaMoving():
	activate_lines.clear()
	
	for i in range(8):
		if i in range(lineNum,lineNum+4):
			activate_lines.append(lines[i])
		else:
			lines[i].get_node("LineGround").color = Color.BLACK
			
	for line in activate_lines:
		line.get_node("LineGround").color = Color("414141")
