extends CharacterBody2D

@export var Speed = 300

var direction : float
var SpawnPos : Vector2
var SpawnRot : float

func _ready():
	global_position = SpawnPos;
	global_rotation = SpawnRot;
	
func _physics_process(delta):
	velocity = Vector2(0, -Speed).rotated(direction);
	move_and_slide()
	await get_tree().create_timer(1.0).timeout
	queue_free()


func _on_fire_zone_body_entered(body):
	body.queue_free();
	queue_free();
