extends CharacterBody2D

const SPEED = 100

func _physics_process(delta):
	var player = get_parent().get_node("player")
	var player_position = player.global_position
	var enemy_position = global_position
	var direction = player_position - enemy_position
	direction = direction.normalized()

	var motion = direction * SPEED * delta
	#motion.x += (randi() % 2);
	#motion.y += (randi() % 2);
	var relative_motion_x = motion.x
	var relative_motion_y = motion.y
	if (relative_motion_x < 0):
		relative_motion_x *= -1;
	if (relative_motion_y < 0):
		relative_motion_y *= -1;
	if (relative_motion_x > relative_motion_y):
		if (relative_motion_x == motion.x):
			$ennemy_animation.flip_h = true;
		else:
			$ennemy_animation.flip_h = false;
		$ennemy_animation.animation = "straight";
	elif (relative_motion_y != motion.y):
		$ennemy_animation.animation = "up";
	else :
		$ennemy_animation.animation = "down";
	$ennemy_animation.play();
	move_and_collide(motion)
