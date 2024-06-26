extends CharacterBody2D

var speed = 150
var screen_size
var motion = Vector2.ZERO

func _ready():
	screen_size = get_viewport_rect().size;
	$player_animation.animation = "move_backward";
	
func _physics_process(delta):
	var collision = move_and_collide(velocity * delta);
	if collision:
		position -= velocity * delta;
		
func _process(delta):
	set_text_life()
	motion = Vector2.ZERO;
	if Input.is_action_pressed("backward"):
		$player_animation.animation = "move_backward";
		motion.y += 2;
	if Input.is_action_pressed("forward"):
		$player_animation.animation = "move_forward";
		motion.y -= 2;
	if Input.is_action_pressed("left"):
		$player_animation.animation = "move_left";
		motion.x -= 2;
	if Input.is_action_pressed("right"):
		$player_animation.animation = "move_right";
		motion.x += 2;
		
	if ( motion.length() > 0 ):
		motion = motion.normalized() * speed;
		$player_animation.play()
	else:
		$player_animation.stop()
		
	position += motion * delta;

func set_text_life():
	$life.text = str(Globals.player_life)
	$text.text = "life remaining :"

func _on_area_2d_body_entered(body):
	if (body.name != "projectile"):
		Globals.player_life -= 1
