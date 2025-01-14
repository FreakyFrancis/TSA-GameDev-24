extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var DASH_ENABLED = true
var CAN_DASH = true
var Player = "P2"
var DASH_TIME = 25;


func _physics_process(delta):
	# Add the gravity.
	#if not is_on_floor():
	#	velocity += get_gravity() * delta

	# Handle jump.
	#if Input.is_action_just_pressed("ui_accept") and is_on_floor():
	#	velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var xdirection = Input.get_axis(Player+"_left", Player+"_right")
	if xdirection:
		velocity.x = xdirection * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	var ydirection = Input.get_axis(Player+"_up", Player+"_down")
	if ydirection:
		velocity.y = ydirection * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)
	
	#print(velocity)
	move_and_slide()

func _input(event):
	if event.is_action_pressed(Player+"_Action"):
		print("dash test")
		if DASH_ENABLED and CAN_DASH:
			print("dashed")
			#$Dash_Cooldown.start();
			#CAN_DASH = false
			#velocity = velocity*DASH_TIME;
			move_and_slide()
	if event.is_action_pressed(Player+"_Special"):
		var tal = load("res://mirror.tscn")
		print("mirror added")
		$".".add_im

func _on_dash_cooldown_timeout():
	CAN_DASH = true;
	pass # Replace with function body.
