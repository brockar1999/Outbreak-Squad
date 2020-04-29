extends Area2D

export var velocity = Vector2()
export var health = 2 setget set_health

# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(true)
	add_to_group("enemy")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	translate(velocity * delta)
	if get_position().y-16 >= get_viewport_rect().size.y:
		queue_free()

func set_health(new_value):
	health = new_value
	if health <= 0: queue_free()
