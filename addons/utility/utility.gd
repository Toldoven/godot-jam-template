class_name Utility


static func _disable_or_enable_collisions(node: Node, set_to: bool) -> void:
	for child in node.get_children():
		if child is CollisionShape2D:
			child.disabled = set_to
		elif child is CollisionPolygon2D:
			child.disabled = set_to
		elif child is CollisionShape3D:
			child.disabled = set_to
		elif child is CollisionPolygon3D:
			child.disabled = set_to


# Loops through children of Node and disables all collision shapeds
static func disable_collisions(node: Node) -> void:
	_disable_or_enable_collisions(node, true)
	

# Loops through children of Node and enables all collision shapeds
static func enable_collisions(node: Node) -> void:
	_disable_or_enable_collisions(node, false)


# A formula for [framerate independent lerp](https://www.rorydriscoll.com/2016/03/07/frame-rate-independent-damping-using-lerp/)
# Example: lerp(..., Utility.fi_lerp(15.0, delta))
# Average recomended speed value is around 10.0 - 20.0
static func fi_lerp(speed: float, delta: float) -> float:
	return 1.0 - exp(-speed * delta)
