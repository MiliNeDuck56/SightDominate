extends Node2D

func keyPressed():
	lineLightning()

func lineLightning():
	get_node("LineGround").color = Color("727272")
	get_node("Lightning").start()
	
func _on_lightning_timeout() -> void:
	get_node("LineGround").color = Color("414141")
