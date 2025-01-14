extends Area2D
var dmg = 10
var talismans = []
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func update(Talismans):
	talismans = Talismans
	if(talismans.size()<3):
		$CollisionPolygon2D.visible = false;
		$CollisionPolygon2D/Polygon2D.visible = false;
		return
	$CollisionPolygon2D.visible = true;
	$CollisionPolygon2D/Polygon2D.visible = true;
	#print(PackedVector2Array(talismans.map(func(tal):return tal.global_position)))
	#$CollisionPolygon2D/Polygon2D
	$CollisionPolygon2D.polygon = PackedVector2Array(talismans.map(func(tal):return tal.global_position))
	#print($CollisionPolygon2D.polygon)
	$CollisionPolygon2D/Polygon2D.polygon  = Geometry2D.convex_hull($CollisionPolygon2D.polygon)
	#print($CollisionPolygon2D/Polygon2D.polygon)

func _on_area_2d_body_entered(body):
	print("violated")
	#print(body.get_groups())
	if "Enemy" in body.get_groups():
		print(body)
		body.dmg_tick(dmg,$".")
	pass # Replace with function body.





func _on_area_2d_body_exited(body):

	pass # Replace with function body.
