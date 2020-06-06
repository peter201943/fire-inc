extends Node




var help = "various gameplay options for the player, difficulty"




class Player:
	var help = "the user's config options for the player"
	class Mouse:
		var help = "user options for the mouse"
		class Sensitivity:
			var help = "how quickly the mouse rotates on the x and y dimensions"
			var x = 0.10
			var y = 0.10
		var sensitivity = Sensitivity.new()
	class Move:
		var help = """
			speed: how quickly the player moves, jump: how high the player jumps,
			acceleration: how quickly the player gains speed, fall: how quickly the player falls down
			"""
		var speed = 5
		var jump = 500
		var acceleration = 50
		var fall = 200
	var mouse = Mouse.new()
	var move = Move.new()
var player = Player.new()




class Difficulty:
	var help = "how hard and what to make hard"
	class Fire:
		var help = "settings for building burning"
		class Burn:
			var help = "rate: how quickly a building loses points, spread: how much more damage a building takes over time"
			var rate = 0.5
			var spread = 0.5
		var burn = Burn.new()
		class Disperse:
			var help = "rate: how quickly the player puts out the fire"
			var rate = 10
		var disperse = Disperse.new()
	var fire = Fire.new()
	class Insurance:
		var help = "penalty: points lost per infraction, reward: points gained per action, bonus: ???"
		var penalty = 100
		var reward = 200
		var bonus = 500
	var insurance = Insurance.new()
	class Score:
		var help = "how many points the player has"
		var rate = 10
	var score = Score.new()
var difficulty = Difficulty.new()








