extends Sprite2D

@export var phase = 0.0;
var counter = phase
# Called when the node enters the scene tree for the first time.
func _ready():
	counter = phase
	pass # Replace with function body.

func _process(delta):
	counter+=delta;
	position.y = position.y + 0.2*sin(5*counter) 
	#print("test2")
	pass
