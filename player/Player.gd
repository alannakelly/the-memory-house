extends KinematicBody2D

class_name Player

export var speed = 100.0
var velocity = Vector2()
var dusting = false;
onready var sprite = $Sprite

# disabled initially
# enabled in Dialogic scene_1_intro
var movement_enabled := false
var swing_enabled := false

func _process(_delta):
	if movement_enabled:
		_set_direction_facing()
	if swing_enabled:
		_swing_input()

func _physics_process(delta):
	if movement_enabled:
		_movement_input()
		move_and_collide(velocity*delta)

func _swing_input():
	if Input.is_action_pressed("ui_select") || Input.is_action_pressed("joy_fire"):
		dusting = true
	else:
		dusting = false

func _set_direction_facing():
	var any_input_down := false

	if Input.is_action_pressed("ui_up") || Input.is_action_pressed("joy_up"):
		sprite.animation = "walk_north"
		any_input_down = true
	if Input.is_action_pressed("ui_down") || Input.is_action_pressed("joy_down"):
		sprite.animation = "walk_south"
		any_input_down = true

	if Input.is_action_pressed("ui_left") || Input.is_action_pressed("joy_left"):
		sprite.flip_h=false
		if not any_input_down: # don't play both vertical and horizontal animatinos
			sprite.animation = "walk_west_east"
		any_input_down = true
	if Input.is_action_pressed("ui_right") || Input.is_action_pressed("joy_right"):
		sprite.flip_h=true
		if not any_input_down: # don't play both vertical and horizontal animatinos
			sprite.animation = "walk_west_east"
		any_input_down = true

	if not any_input_down:
		sprite.animation = "idle_west_east"

func _movement_input():
	velocity = Vector2()
	if Input.is_action_pressed("ui_up") || Input.is_action_pressed("joy_up"):
		velocity.y -= speed
	if Input.is_action_pressed("ui_down") || Input.is_action_pressed("joy_down"):
		velocity.y += speed
	if Input.is_action_pressed("ui_left") || Input.is_action_pressed("joy_left"):
		velocity.x -= speed
	if Input.is_action_pressed("ui_right") || Input.is_action_pressed("joy_right"):
		velocity.x += speed

