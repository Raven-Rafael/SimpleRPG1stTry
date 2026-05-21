extends CharacterBody2D

const SPEED = 30.0
var direction = 1 # 1 = right, -1 = left

#x to left right, y 0 so it don't fall of float
func _physics_process(delta):
	velocity.x = direction * SPEED
	velocity.y = 0
	
	move_and_slide()
	
#If hits a wall or other thing, it changes the direction
	if is_on_wall():
		direction = direction * -1

#If hits the player, will restart
func _on_area_2d_body_entered(body):
	
	if body.name == "Player":
		get_tree().reload_current_scene()
#	var direction := Input.get_axis("ui_left", "ui_right")
