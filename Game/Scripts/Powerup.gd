extends Area2D

var velocity = Vector2(0, 200)

# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(true)
	pass # Replace with function body.

func _process(delta):
	translate(velocity * delta)
	
	if get_position().y >= get_viewport_rect().size.y+16:
		queue_free()
