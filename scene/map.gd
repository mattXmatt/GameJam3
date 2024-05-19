extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Globals.player_life == 0:
		get_tree().quit()


func _on_area_2d_body_entered(body):
	if (body.name != "player" && body.name != "ennemy"):
		$Area2D/AnimatedSprite2D.play("on")
		await get_tree().create_timer(2.0).timeout
		get_tree().quit()
