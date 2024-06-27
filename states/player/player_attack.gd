extends State

class_name PlayerAttack
@export var animated_sprite : AnimatedSprite2D
@export var player : Player
@export var attack_box : Area2D

func Enter():
	animated_sprite.play("attack")
	# Make the player stand still when attacking
	player.velocity.x = 0
	player.move_and_slide()
	
func Update(_delta: float):
	if animated_sprite.is_playing():
		if animated_sprite.frame >= 4 and animated_sprite.frame <= 5:
			attack_box.monitoring = true
			attack_box.visible = true
		else:
			attack_box.monitoring = false
			attack_box.visible = false
		return
	Transitioned.emit(self, "idle")	


func _on_attack_box_body_entered(body):
	if body is Mob:
		body.take_damage(player.ATTACK_DAMAGE, attack_box)


func _on_player_player_hurt():
	Transitioned.emit(self, "hurt")
