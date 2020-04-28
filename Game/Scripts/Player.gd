extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


func _ready(): #only called once
	set_process(true)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var motion = (get_global_mouse_position().x - get_position().x) * 0.2
	translate(Vector2(motion,0))
	
	var view_size = get_viewport_rect().size
	var pos = get_position()
	pos.x = clamp(pos.x,0+32, view_size.x-32)
	set_position(pos)
