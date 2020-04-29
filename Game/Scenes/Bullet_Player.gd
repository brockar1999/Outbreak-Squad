extends "res://Scripts/Bullet.gd"



# Called when the node enters the scene tree for the first time.
func _ready():
	connect("area_entered", self, "_on_area_enter")
	pass # Replace with function body.


func _on_Bullet_area_entered(area):
	if area.is_in_group("enemy"):
		area.health -= 1
		queue_free()
	pass # Replace with function body.
