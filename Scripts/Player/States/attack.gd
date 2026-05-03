extends State

func enter():
	entity.velocity = Vector2.ZERO
	entity.play_anim("attack")
	entity.enable_attack_hitbox()

func update(delta):
	pass

func exit():
	entity.disable_attack_hitbox()
