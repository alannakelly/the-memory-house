extends Control

func _ready():
	pass 

func _on_StartButton_pressed():
	get_tree().change_scene("res://main/Main.tscn")

func _on_BackButton_pressed():
	get_tree().change_scene("res://title/Title.tscn")
