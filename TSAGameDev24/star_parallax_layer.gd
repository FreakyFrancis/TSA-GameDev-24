extends ParallaxLayer

var counter = 0.0
@export var speed = 120
@export var direction = speed*(Vector2(-1.8,1))
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	counter += 0.1*delta
	#print(delta)
	#print(counter)
	direction = Vector2(sin(counter),cos(counter))
	self.motion_offset += speed * direction* delta
	direction
	pass
