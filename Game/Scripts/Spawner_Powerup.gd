extends Node

const powerups = [
	preload("res://scenes/HealthUp.tscn"),
	preload("res://scenes/1Up.tscn"),
]

# Called when the node enters the scene tree for the first time.
func _ready():
	yield(get_tree().create_timer(rand_range(10,15)), "timeout")
	spawn()

func spawn():
	while true:
		randomize()
		var choice = randi()%2
		var powerup = powerups[choice].instance()
		var pos = Vector2()
		pos.x = rand_range(0+16, get_viewport().get_visible_rect().size.x-16)
		pos.y = 0-16
		powerup.set_position(pos)
		get_node("Container").add_child(powerup)
		yield(get_tree().create_timer(rand_range(10,15)), "timeout")
# Called every frame. 'delta' is the elapsed time since the previous frame.
