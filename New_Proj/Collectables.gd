extends Node2D

var cherry = preload("res://Collectables/Cherry.tscn")

func _on_cherry_spawn_timeout():
	var rng = RandomNumberGenerator.new()
	var cherryTemp = cherry.instantiate()
	var cherryPos = rng.randi_range(20,2284)
	
	if Game.cherrySpawned == false:
		cherryTemp.position = Vector2(cherryPos, 416)
		get_node("Spawned").add_child(cherryTemp)
		Game.cherrySpawned = true
