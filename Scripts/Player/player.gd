extends Entity

@export var damage = 15

func get_input_direction():
	return Input.get_vector("move_left","move_right","move_up","move_down")

func is_attack_pressed():
	return Input.is_action_just_pressed("attack")

func is_guard_pressed():
	return Input.is_action_pressed("guard")


func _on_animated_sprite_2d_animation_finished() -> void:
	if sprite.animation == "attack":
		state_machine.change_state(state_machine.get_node("Idle"))


func _on_attack_area_body_entered(body):
	if body.has_method("take_damage"):
		body.take_damage(damage)
