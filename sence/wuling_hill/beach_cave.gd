
extends Node2D

# Member variables
const CAVE_LIMIT = 1200


func _input(event):
	if event is InputEventMouseMotion and event.button_mask&1:
		var rel_x = event.relative.x
		var cavepos = $cave.position
		cavepos.x += rel_x
		if cavepos.x < -CAVE_LIMIT:
			cavepos.x = -CAVE_LIMIT
		elif cavepos.x > 0:
			cavepos.x = 0
		$cave.position = cavepos


func _ready():
	while ($cave.position.x > -1200):
		print($cave.position.x)
		yield(get_tree().create_timer(0.1), "timeout")
		$cave.move_local_x($cave.position.x - 5,false)