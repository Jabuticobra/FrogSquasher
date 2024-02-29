extends Area2D


func _on_body_entered(body):
	if body.name == "Player":
		if Game.playerHP < 9:
			Game.playerHP += 2
		if Game.playerHP == 9:
			Game.playerHP += 1
		if Game.playerHP >= 10:
			Game.gold += 3
		despawnAnim()

func despawnAnim():
	var rise = get_tree().create_tween()
	var vanish = get_tree().create_tween()
	rise.tween_property(self, "position", position - Vector2(0,30), 0.3 )
	vanish.tween_property(self, "modulate:a", 0, 0.25)
	rise.tween_callback(despawnCherry)

func mooveCherry():
	var rng = RandomNumberGenerator.new()
	var placing = rng.randi_range(20,2284)
	var moove = get_tree().create_tween()
	moove.tween_property(self, "position", placing, 0)

func despawnCherry():
	queue_free()
	Game.cherrySpawned = false
