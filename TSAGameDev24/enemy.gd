extends Node2D
var hp
var ticking = false
var dmg_amount = 0
var dmg_centers = []

# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	velocity
	pass

func dmg_tick(dmg,poly):
	ticking = true
	dmg_amount += dmg
	var x = 0;
	var y = 0;
	for vect in poly.polygon:
		x += vect.x
		y += vect.y
	x = x/poly.polygon.size()
	y = y/poly.polygon.size()
	dmg_centers.append(Vector2(x,y))
	pass
