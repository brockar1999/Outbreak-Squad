extends "res://Scripts/Powerup.gd"



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



func _on_HealthUp_area_entered(area):
	if area.is_in_group("player"):
		Audio.play("PowerUp")
		area.health += 1
		queue_free()
