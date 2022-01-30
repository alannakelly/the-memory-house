extends Node2D

onready var dialog = $Dialog
onready var player = $Player
onready var water_prop = $WaterProp

signal scene_1_complete()

func _ready():
	dialog.connect("dialogic_signal", self, "_on_dialog_signal")

func _on_dialog_signal(arg):
	match arg:
		"scene_1_enable_movement":
			player.movement_enabled = true

		"scene_1_enable_swing":
			player.swing_enabled = true

		"scene_1_complete":
			emit_signal("scene_1_complete")

		_: assert(false, "Unhandled Dialog Signal (%s)" % arg)
