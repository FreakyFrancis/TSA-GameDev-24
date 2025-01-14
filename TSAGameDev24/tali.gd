extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var DASH_ENABLED = true
var CAN_DASH = true
var Player = "P1"
var DASH_TIME = 25
var talisman_counter = 0
var talismans = []
var dmg = 10;
var talismanMax = 5

func _draw():
	#print(talismans.size())
	# Draw line from player to each talisman
	#for t in range(talismans.size()-1):
		#if not is_instance_valid(talismans[t]):
			#talismans.remove_at(t)
	#if(talismans.size()<1):
		#return
	var talismans_pos = Geometry2D.convex_hull(talismans.map(func(tal):return tal.global_position))
	if talismans_pos:
		var tal_pos = to_local(talismans_pos[-1])
		#draw_line(Vector2.ZERO, tal_pos, Color(0.667, 0.881, 0.898), 10)
		#print(tal_pos)
		for i in range(talismans_pos.size()):
			tal_pos = to_local(talismans_pos[i])
			if i > 0:
				var prev_tal_pos = to_local(talismans_pos[i - 1])
				draw_line(prev_tal_pos, tal_pos, Color(0.085, 0.911, 0.94), 10)
		draw_line(to_local(talismans_pos[-1]),to_local(talismans_pos[0]),Color(0.085, 0.911, 0.94), 10)

func _physics_process(delta):
	queue_redraw()
	
	# Handle movement
	var xdirection = Input.get_axis(Player + "_left", Player + "_right")
	if xdirection:
		velocity.x = xdirection * SPEED
		if(xdirection<0):
			$AnimatedSprite2D.flip_h = true
		else:
			$AnimatedSprite2D.flip_h = false
		$AnimatedSprite2D.play("Walk")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	
	var ydirection = Input.get_axis(Player + "_up", Player + "_down")
	if ydirection:
		velocity.y = ydirection * SPEED
		$AnimatedSprite2D.play("Walk")
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)
	move_and_slide()
	
	if(not (xdirection and ydirection)):
		$AnimatedSprite2D.play("Idle")

func _input(event):
	if event.is_action_pressed(Player + "_Action"):
		if DASH_ENABLED and CAN_DASH:
			$Dash_Cooldown.start()
			CAN_DASH = false
			$CollisionShape2D.disabled = true;
			global_position += DASH_TIME*SPEED*velocity.normalized()*0.02
			$CollisionShape2D.disabled = false;
			var afterimg = preload("res://dash_afterimage.tscn")
			var afterimg_instance = afterimg.instantiate()
			afterimg_instance.global_position = global_position
			get_parent().add_child(afterimg_instance)
			print("shadow left")
			#move_and_slide()
	
	if event.is_action_pressed(Player + "_Special"):
		var tal_scene = preload("res://talisman.tscn")
		var tal_instance = tal_scene.instantiate()
		tal_instance.global_position = global_position
		get_parent().add_child(tal_instance)
		talismans.append(tal_instance)
		talisman_counter += 1
		if(talisman_counter>talismanMax):
			talismans[0].queue_free()
			talismans.remove_at(0)
			talisman_counter-=1;
		get_tree().get_nodes_in_group("TalismanArea")[0].update(talismans)
		#print(poly)
func updateTalismans():
	talismans.remove_at(0)
	talisman_counter -=1;
	get_tree().get_nodes_in_group("TalismanArea")[0].update(talismans)
	
func _on_dash_cooldown_timeout():
	CAN_DASH = true
