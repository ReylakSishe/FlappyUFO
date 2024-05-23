extends CollisionShape2D

# Called when the node enters the scene tree for the first time.
func _ready():
	if body.is_in_group("Player"):
		morir()
