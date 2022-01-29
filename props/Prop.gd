extends Node2D

func _on_Collision_body_entered(body):
	print_debug("hit by: ", body)
