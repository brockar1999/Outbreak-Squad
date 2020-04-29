extends AnimationPlayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	play("idle")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

#Not fully functioning
func _on_Enemy_Boss_halfhealth():
	play("hurt")
	pass # Replace with function body.
