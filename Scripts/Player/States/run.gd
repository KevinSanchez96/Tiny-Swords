extends State

var last_direction = Vector2.RIGHT

func enter():
	entity.play_anim("run")
	
func update(delta):
	var direction = entity.get_input_direction()
	
	entity.velocity = direction * entity.speed
	if direction.x < 0:
		entity.sprite.flip_h = true
	elif direction.x > 0:
		entity.sprite.flip_h = false
	
	if direction != Vector2.ZERO:
		last_direction = direction
	
	if entity.is_attack_pressed():
		entity.state_machine.change_state(entity.state_machine.get_node("Attack"))
	if entity.is_guard_pressed():
		entity.state_machine.change_state(entity.state_machine.get_node("Guard"))
	if direction == Vector2.ZERO:
		entity.state_machine.change_state(entity.state_machine.get_node("Idle"))
