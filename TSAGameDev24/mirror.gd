extends Node2D
var counter = 0;

# Called when the node enters the scene tree for the first time.
func _ready():
	#move_to_front()
	#print(get_parent())
	global_position = get_parent().global_position
	#print(position)
	$AnimatedSprite2D.play("default")
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	counter+=delta;
	$AnimatedSprite2D.position.y = $AnimatedSprite2D.position.y + sin(5*counter) 
	$AnimatedSprite2D.scale.x = sin(2*counter)
	#global_position = global_position + to_local((delta)*(-global_position +  get_parent().global_position))
	print(position)
	pass


func _on_animated_sprite_2d_animation_finished():
	$AnimatedSprite2D.play("3")
	pass # Replace with function body.
