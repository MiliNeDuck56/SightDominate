extends Node2D

const GRID_HEIGHT = 101.25
const VISIBLE_COUNT = 4
const BUFFER_COUNT = 1

var LINE
var grid_scene = preload("res://prototype/levelEditer/levelControl/grid.tscn")
var pool: Array = []
var value = 4

var max_row_index := 0   # 노래 길이로 계산 (아래 설명)

var totalSeconds = null
var bpm = null
var bpmNode

func _ready():
	bpmNode = $"../../../../../MusicEdit/selectBPM/LineEdit"
	bpmNode.text_changed.connect(bpmChange)
	LINE = get_parent()

func itemSelected(v):
	value = v
	rebuildPool()

func rebuildPool():
	for g in pool:
		g.queue_free()
	pool.clear()
	var total = VISIBLE_COUNT + BUFFER_COUNT * 2
	for i in range(total):
		spawnGrid(i - BUFFER_COUNT)

func spawnGrid(row_index: int) -> Node:
	var g = grid_scene.instantiate()
	add_child(g)
	g.setup(LINE, row_index, value)
	g.position = Vector2(0, row_index * GRID_HEIGHT)
	pool.append(g)
	return g

func scrollTo(current_row_float: float):
	current_row_float = clamp(current_row_float, 0.0, float(max_row_index))
	var scroll_offset = current_row_float * GRID_HEIGHT
	for g in pool:
		g.position.y = (g.row_index * GRID_HEIGHT) - scroll_offset
	recycleIfNeeded(current_row_float)

func recycleIfNeeded(current_row_float: float):
	var sorted = pool.duplicate()
	sorted.sort_custom(func(a, b): return a.row_index < b.row_index)
	var top = sorted[0]
	var bottom = sorted[sorted.size() - 1]

	# 되감기: 맨 아래가 화면 밖으로 완전히 나갔으면 위로 재활용
	if bottom.row_index - current_row_float > VISIBLE_COUNT + BUFFER_COUNT:
		var new_index = top.row_index - 1
		if new_index >= 0:
			bottom.setup(LINE, new_index, value)

	# 정방향: 맨 위가 화면 밖으로 나갔으면 아래로 재활용
	if current_row_float - top.row_index > BUFFER_COUNT:
		var new_index = bottom.row_index + 1
		if new_index <= max_row_index:
			top.setup(LINE, new_index, value)

func musicSelected(total_seconds):
	totalSeconds = total_seconds
	recalcMaxRow()

func bpmChange(new_text:String):
	bpm = int(new_text)
	recalcMaxRow()

func recalcMaxRow():
	print(bpm,totalSeconds)
	if bpm == null or totalSeconds == null:
		return
	var row_duration = 60.0 / float(bpm)
	max_row_index = int(floor(totalSeconds / row_duration))
