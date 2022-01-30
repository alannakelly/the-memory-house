extends Node2D

enum Type {
	NONE,
	FLOWER_POT,
	BOOKSHELF,
	TABLE,
	GLASS_OF_WATER,
	WARDROBE,
	CAKE_SLICER,
	DINING_CLOTH,
	PLAYING_CARDS,
	INDOOR_PLANTS
}

var dusted = false;
var color = Color(0.0,0.0,1.0)
export(Type) var type = Type.NONE

onready var dialog = $"/root/Node2D/Dialog"
var scene1_complete := false

var bodies_colliding := []

func _ready():
	dialog.connect("dialogic_signal", self, "_on_dialog_signal")

func _on_dialog_signal(arg):
	if arg == "scene_1_enable_movement":
		scene1_complete = true

func _on_Collision_body_entered(body):
	if body is Player:
		bodies_colliding.append(body)

func _on_Collision_body_exited(body):
	if body is Player:
		bodies_colliding.erase(body)

func _process(_delta):
	for body in bodies_colliding:
		if body.dusting:
			_handle_dusted()

func _handle_dusted():
	if not dusted and scene1_complete:
		dusted = true
		self.modulate = Color(0.0,1.0,0.5)

		match type:
			Type.GLASS_OF_WATER:
				dialog.start_timeline("scene2_water_prop")
			Type.BOOKSHELF:
				dialog.start_timeline("scene3_bookshelf")
			Type.FLOWER_POT:
				dialog.start_timeline("scene4_pot")

