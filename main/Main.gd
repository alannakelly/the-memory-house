extends Node2D

onready var dialogic = $Dialog.dialogic
onready var player = $Player
onready var water_prop = $WaterProp

func _ready():
	dialogic.connect("dialogic_signal", self, "_on_dialog_signal")

func _on_dialog_signal(arg):
	match arg:
		"scene_1_enable_movement":
			player.movement_enabled = true

		"scene_1_show_ctrl_swing":
			player.swing_enabled = true

		_: assert(false, "Unhandled Dialog Signal (%s)" % arg)
