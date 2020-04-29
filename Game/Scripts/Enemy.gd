extends Area2D

export var velocity = Vector2()
export var health = 2 setget set_health
export var points = 0

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
	if new_value < health:
		Audio.play("EnemyHurt")
	health = new_value
	if health <= 0: 
		Audio.play("EnemyDeath")
		get_node("/root/Game/HUD/Score").score += points
		queue_free()
