extends KinematicBody2D

class_name Player

export var speed = 100.0
var velocity = Vector2()
var dusting = false;
onready var sprite = $Sprite

func _process(delta):
	if Input.is_action_pressed("ui_select"):
		dusting = true
	else:
		dusting = false
		
	sprite.flip_h=false
	if Input.is_action_pressed("ui_up"):
		sprite.animation = "walk_north"
	if Input.is_action_pressed("ui_down"):
		sprite.animation = "walk_south"
	if Input.is_action_pressed("ui_left"):
		sprite.animation = "walk_west_east"
	if Input.is_action_pressed("ui_right"):
		sprite.flip_h=true
		sprite.animation = "walk_west_east"

func get_input():
	velocity = Vector2()
	if Input.is_action_pressed("ui_up"):
		velocity.y -= speed
	if Input.is_action_pressed("ui_down"):
		velocity.y += speed
	if Input.is_action_pressed("ui_left"):
		velocity.x -= speed
	if Input.is_action_pressed("ui_right"):
		velocity.x += speed

func _physics_process(delta):
	get_input()
	move_and_collide(velocity*delta)
