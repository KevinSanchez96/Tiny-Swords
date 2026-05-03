extends Node

var current_state: State

func _ready():
	await get_parent().ready
	current_state = $Idle
	current_state.enter()
	
func change_state(new_state):
	current_state.exit()
	current_state = new_state
	current_state.enter()

func update(delta):
	current_state.update(delta)
