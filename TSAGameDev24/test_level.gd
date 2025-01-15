extends Node2D
var counter = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.start()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_timer_timeout():
	var enem = preload("res://enemy.tscn")
	var enem_inst = enem.instantiate()
	add_child(enem_inst)
	var rng = RandomNumberGenerator.new().randi_range(1,4)
	match rng:
		1:
			enem_inst.translate(Vector2(-100,RandomNumberGenerator.new().randi_range(0,ProjectSettings.get_setting("display/window/size/viewport_height"))))
		2:
			enem_inst.translate()
		3:
			enem_inst.translate()
		4:
			enem_inst.translate()
		
	$Timer.start()
	pass # Replace with function body.
