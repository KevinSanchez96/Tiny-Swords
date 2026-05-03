extends State

func enter():
	entity.velocity = Vector2.ZERO
	entity.play_anim("guard")
	
func update(delta):
	if not entity.is_guard_pressed():
		entity.state_machine.change_state(entity.state_machine.get_node("Idle"))
	if entity.is_attack_pressed():
		entity.state_machine.change_state(entity.state_machine.get_node("Attack"))
