extends Control


## The timeline to load when starting the scene
export(String, "TimelineDropdown") var timeline: String
export(bool) var add_canvas = true
export(bool) var reset_saves = true
export(bool) var debug_mode = false

signal dialogic_signal(arg)

var dialogic

func _ready():
	hide()

	dialogic = Dialogic.start(timeline, '', "res://addons/dialogic/Nodes/DialogNode.tscn",  debug_mode, add_canvas)
	get_parent().call_deferred('add_child', dialogic)
	dialogic.connect("dialogic_signal", self, "_on_dialog_signal")

# re-emit the signal since dialogic isn't in tree on _ready
func _on_dialog_signal(arg):
	emit_signal("dialogic_signal", arg)

func start_timeline(timeline_name:String):
	dialogic = Dialogic.start(timeline_name, '', "res://addons/dialogic/Nodes/DialogNode.tscn",  debug_mode, add_canvas)
	get_parent().call_deferred('add_child', dialogic)
