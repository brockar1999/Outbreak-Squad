extends "res://Scripts/Bullet.gd"



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_Bullet_area_entered(area):
	if area.is_in_group("enemy"):
		area.health -= 1
		get_node("/root/Game/Camera").shake(5, 0.13)   
		queue_free()
	pass # Replace with function body.
