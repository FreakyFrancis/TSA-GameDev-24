extends CharacterBody2D
var hp
var ticking = false
var dmg_amount = 0
var dmg_centers = []
var speed = 300

# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	velocity = position - ave(dmg_centers)
	velocity = velocity.normalized() * speed
	move_and_slide()
	pass

func dmg_tick(dmg,poly):
	ticking = true
	dmg_amount += dmg
	dmg_centers.append(ave(poly.polygon))
	pass
	
func ave(pps):
	if pps.size()==0:
		return Vector2(0,0)
	var x = 0;
	var y = 0;
	for vect in pps:
		x += vect.x
		y += vect.y
	x = x/pps.size()
	y = y/pps.size()
	return Vector2(x,y)
		
