extends Node


class Status:
	var help = "how the player stats are tracked"
	class Player:
		var help = "score: how many points the player has"
		var score = 0
	var player = Player.new()
	class Level:
		var help = "which building/scene the player is currently on"
		var name = "ERROR"
	var level = Level.new()
var status = Status.new()










