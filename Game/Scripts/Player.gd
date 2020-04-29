extends Area2D

const bullet_scn = preload("res://scenes/Bullet_Player.tscn")
var health = 4 setget set_health
var lives = 1 setget set_lives

signal health_changed

func _ready(): #only called once
	set_process(true)
	shoot()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var motion = (get_global_mouse_position().x - get_position().x) * 0.2
	translate(Vector2(motion,0))
	
	var view_size = get_viewport_rect().size
	var pos = get_position()
	pos.x = clamp(pos.x,0+32, view_size.x-32)
	set_position(pos)

func shoot():
	while (true):
		Audio.play("Shoot")
		var pos = self.get_position()
		create_bullet(pos)
		yield(get_tree().create_timer(.75), "timeout")

func create_bullet(pos):
	var bullet = bullet_scn.instance()
	bullet.set_position(pos)
	get_parent().add_child(bullet)

func set_health(new_value):
	if new_value > 4: return
	if new_value < health:
		Audio.play("PlayerHurt")
	
	health = new_value
	emit_signal("health_changed", health)
	if health <= 0: 
		get_node("/root/Game/Camera").shake(20, 0.13) 
		set_lives(lives - 1)

func set_lives(new_value):
	lives = new_value
	get_node("/root/Game/Camera").shake(30, 0.13) 
	if lives <= 0:
		Audio.play("PlayerDeath")
		queue_free()
	health = 4
