extends Node2D
var counter = 0;
var tween;

# Called when the node enters the scene tree for the first time.
func _ready():
	tween = get_tree().create_tween()
	#move_to_front()
	#print(get_parent())
	position = get_tree().get_nodes_in_group("Player")[1].position
	#print(position)
	$AnimatedSprite2D.play("Startup")
	#$Timer1.start()
	tween.tween_property($AnimatedSprite2D,"modulate",Color("0015ff6c"),15)
	tween.finished.connect(leave)
	#print("test1")
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	counter+=delta;
	position.y = position.y + 0.2*sin(5*counter) 
	#print("test2")
	pass

func leave():
	get_tree().get_nodes_in_group("Player")[1].updateTalismans()
	queue_free()

func _on_animated_sprite_2d_animation_finished():
	$AnimatedSprite2D.play(str(RandomNumberGenerator.new().randi_range(1,5)))
	pass # Replace with function body.
