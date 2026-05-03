extends State

func enter():
	entity.velocity = Vector2.ZERO
	entity.play_anim("idle")

func update(delta):
	var direction = entity.get_input_direction()
	
	if direction != Vector2.ZERO:
		entity.state_machine.change_state(entity.state_machine.get_node("Run"))
		return
		
	if entity.is_attack_pressed():
		entity.state_machine.change_state(entity.state_machine.get_node("Attack"))
		return
	
	if entity.is_guard_pressed():
		entity.state_machine.change_state(entity.state_machine.get_node("Guard"))
		return
		
