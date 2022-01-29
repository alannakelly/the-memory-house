extends Node2D

onready var timer := $Timer

func _ready():
	pass

func _on_Timer_timeout():
	get_tree().change_scene("res://title/Title.tscn")
