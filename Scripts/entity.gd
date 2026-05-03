extends CharacterBody2D
class_name Entity

@export var speed := 200

@onready var state_machine = $StateMachine
@onready var sprite = $AnimatedSprite2D
@onready var attack_area = $AttackArea

func _ready():
	for state in state_machine.get_children():
		state.entity = self

func _physics_process(delta):
	state_machine.update(delta)
	move_and_slide()


func play_anim(anim_name: String):
	if sprite.animation == anim_name:
		return
	
	sprite.play(anim_name)

func enable_attack_hitbox():
	attack_area.monitoring = true

func disable_attack_hitbox():
	attack_area.monitoring = true
	
func get_input_direction():
	return Vector2.ZERO

func is_attack_pressed():
	return false

func is_guard_pressed():
	return false
