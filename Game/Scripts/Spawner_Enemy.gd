extends Node

const enemies = [
	preload("res://scenes/Enemy_Amoeba.tscn"),
	preload("res://scenes/Enemy_Bacterio.tscn"),
	preload("res://scenes/Enemy_Bloodclotter.tscn"),
	preload("res://scenes/Enemy_Germgunner.tscn")
]

# Called when the node enters the scene tree for the first time.
func _ready():
	yield(get_tree().create_timer(1), "timeout")
	spawn()

func spawn():
	while true:
		randomize()
		var choice = randi()%4
		var enemy = enemies[choice].instance()
		var pos = Vector2()
		pos.x = rand_range(0+16, get_viewport().get_visible_rect().size.x-16)
		pos.y = 0-16
		enemy.set_position(pos)
		get_node("Container").add_child(enemy)
		yield(get_tree().create_timer(rand_range(0.5,1.25)), "timeout")
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
