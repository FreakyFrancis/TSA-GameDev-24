extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	print("shadow confirmed")
	#$Sprite2D.modulate.a = move_toward($Sprite2D.modulate.a,0,0.1)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var tween = get_tree().create_tween()
	tween.tween_property($Sprite2D,"modulate:a",0,0.1)
	if $Sprite2D.modulate.a<0.01:
		print("shadow freed")
		self.queue_free()
	pass
