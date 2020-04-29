extends "res://Scripts/Bullet.gd"


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_Bullet_area_entered(area):
	if area.is_in_group("player"):
		area.health -= 1
		get_node("/root/Game/Camera").shake(10, 0.13) 
		queue_free()
	pass # Replace with function body.
