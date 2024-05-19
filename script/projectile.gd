extends CharacterBody2D

@export var Speed = 100

var direction : float
var SpawnPos : Vector2
var SpawnRot : float

func _ready():
	global_position = SpawnPos;
	global_rotation = SpawnRot;
	
func _physics_process(delta):
	velocity = Vector2(0, -Speed).rotated(direction);
	move_and_slide()
