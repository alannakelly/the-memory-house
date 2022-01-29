extends Node2D


func _ready():
	$AnimationPlayer.play("intro")


func _on_StartButton_pressed():
	get_tree().change_scene("res://main/Main.tscn")


func _on_HowToPlayButton_pressed():
	get_tree().change_scene("res://how_to_play/HowToPlay.tscn")


func _on_QuitButton_pressed():
	get_tree().quit()
