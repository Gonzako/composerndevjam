extends RigidBody2D



func _on_body_entered(body: Node) -> void:
	print("Hit node " + body.name)
	body.get_reckt()
	if body.has_method("get_reckt"):
		body.get_reckt()
	pass # Replace with function body.
