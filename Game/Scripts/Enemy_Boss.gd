extends Area2D

export var velocity = Vector2()
export var health = 10 setget set_health
export var points = 0
const bullet_scn = preload("res://scenes/Bullet_Enemy.tscn")
signal halfhealth

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("idle")
	yield(get_tree().create_timer(.75), "timeout")
	shoot()

func set_health(new_value):
	if new_value < health:
		Audio.play("BossHurt")
	health = new_value
	if health <= 5:
		emit_signal("halfhealth")
	if health <= 0: 
		Audio.play("BossDeath")
		queue_free()
		get_tree().change_scene("res://Scenes/Main.tscn")

func shoot():
	while true:
		var bullet = bullet_scn.instance()
		bullet.set_position(get_position())
		get_parent().add_child(bullet)
		yield(get_tree().create_timer(.5), "timeout")
