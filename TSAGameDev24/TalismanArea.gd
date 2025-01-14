extends Area2D
var dmg = 5
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
		return
	print(PackedVector2Array(talismans.map(func(tal):return tal.global_position)))
	#$CollisionPolygon2D/Polygon2D
	$CollisionPolygon2D.polygon = PackedVector2Array(talismans.map(func(tal):return tal.global_position+Vector2(0,20)))
	#print($CollisionPolygon2D.polygon)
	$CollisionPolygon2D/Polygon2D.polygon  = Geometry2D.convex_hull($CollisionPolygon2D.polygon)
	#print($CollisionPolygon2D/Polygon2D.polygon)

func _on_area_2d_body_entered(body):

	if "Enemy" in body.get_groups():

		body.dmg_tick(dmg,$Area2D/CollisionPolygon2D)
	pass # Replace with function body.





func _on_area_2d_body_exited(body):

	pass # Replace with function body.
