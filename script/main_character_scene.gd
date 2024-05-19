extends Node2D

@onready var main = get_tree().get_root().get_node(".")
@onready var projectile = load("res://scene/projectile.tscn");

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("shoot"):
		shoot();

func shoot():
	var angle = 0;
	var instance = projectile.instantiate();
	instance.SpawnPos = $player.position;
	if ( $player/player_animation.animation == "move_right" ):
		angle = 90;
		instance.SpawnPos.x += 40;
	if ( $player/player_animation.animation == "move_left" ):
		angle = -90;
		instance.SpawnPos.x -= 40;
	if ( $player/player_animation.animation == "move_backward" ):
		angle = 180;
	instance.direction = angle * 3.14/180;
	instance.SpawnRot = angle * 3.14/180;
	main.add_child.call_deferred(instance);
