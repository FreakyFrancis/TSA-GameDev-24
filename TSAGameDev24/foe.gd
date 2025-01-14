extends CharacterBody2D
var ticking = false
var dmg_amount = 0
var dmgers = []
var speed = 250

# Called when the node enters the scene tree for the first time.
func _ready():
	$TextureProgressBar.value = $TextureProgressBar.max_value
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var closer = get_tree().get_nodes_in_group("Player")[0] if (-global_position+get_tree().get_nodes_in_group("Player")[0].global_position).length() < (-global_position+get_tree().get_nodes_in_group("Player")[1].global_position).length() else get_tree().get_nodes_in_group("Player")[1] 
	velocity = -position + closer.global_position
	velocity = velocity.normalized() * speed
	move_and_slide()
	if ticking:
		$TextureProgressBar.value -= dmg_amount*delta
		print($TextureProgressBar.value)
		if($TextureProgressBar.value <= 0):
			print("death")
			queue_free()
	#print(str(ticking)+" "+str($TextureProgressBar.value))
	pass

func dmg_tick(dmg,source):
	ticking = true
	dmgers.append(source)
	dmg_amount += source.dmg
	#dmg_centers.append(ave(poly.polygon))
	pass

func dmg_stop(source):
	dmgers.erase(source)
	dmg_amount -= source
	
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
		
