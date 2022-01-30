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
export var type = Type.NONE

func _on_Collision_body_entered(body):
	if body is Player:
		if body.dusting:
			dusted = true
			self.modulate = Color(0.0,1.0,0.5)
