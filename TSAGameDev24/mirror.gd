extends Node2D
var counter = 0;

# Called when the node enters the scene tree for the first time.
func _ready():
	#move_to_front()
	#print(get_parent())
	position = get_parent().get_child(1).position
	#print(position)
	$AnimatedSprite2D.play("Startup")
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	counter+=delta;
	$AnimatedSprite2D.position.y = $AnimatedSprite2D.position.y + sin(5*counter) 
	$AnimatedSprite2D.scale.x = sin(2*counter)
	pass


func _on_animated_sprite_2d_animation_finished():
	$AnimatedSprite2D.play("3")
	pass # Replace with function body.
