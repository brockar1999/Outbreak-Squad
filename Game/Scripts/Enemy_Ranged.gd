extends "res://Scripts/Enemy.gd"

const bullet_scn = preload("res://scenes/Bullet_Enemy.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	var direction = randi()%2+1
	if direction == 1:
		velocity.x *= -1
	yield(get_tree().create_timer(.75), "timeout")
	shoot()

func _process(delta):
	yield(get_node("Vis"), "screen_exited")
	queue_free()

func shoot():
	while true:
		var bullet = bullet_scn.instance()
		bullet.set_position(get_position())
		get_parent().add_child(bullet)
		yield(get_tree().create_timer(1), "timeout")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
