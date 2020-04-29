extends Area2D

export var velocity = Vector2()

# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(true)
	yield(get_node("Vis"), "screen_exited")
	queue_free()
	pass # Replace with function body.

func _process(delta):
	translate(velocity * delta)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
