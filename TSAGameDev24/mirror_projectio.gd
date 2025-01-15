extends AnimatedSprite2D
var counter = 0;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	counter+=delta;
	position.y = position.y + 0.7*sin(5*counter) 
	scale.x = sin(2*counter)
	#global_position = global_position + to_local((delta)*(-global_position +  get_parent().global_position))
	#print(position)
	pass
