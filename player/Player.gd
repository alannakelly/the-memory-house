extends KinematicBody2D

export var gravity = Vector2(0.0,2500.0)
export var speed = 2500.0
var velocity = Vector2()

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
	velocity += gravity
	move_and_slide(velocity*delta)
	
