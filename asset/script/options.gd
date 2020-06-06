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
		var fall = 500
	var mouse = Mouse.new()
	var move = Move.new()
	var api = """
player
	help
	mouse
		help
		sensitivity
			help
			x
			y
	move
		help
		speed
		jump
		acceleration
		fall
	api
"""
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
			var help = """
			rate: how quickly the player fires,
			size: how big the projectiles are,
			damage: how powerful a single projectile is
			"""
			var rate = 10
			var size = 10
			var damage = 10
		var disperse = Disperse.new()
	var fire = Fire.new()
	class Insurance:
		var help = "penalty: points lost per infraction, reward: points gained per action, bonus: ???"
		var penalty = 100
		var reward = 200
		var bonus = 500
	var insurance = Insurance.new()
	class Buildings:
		var help = "how many windows, window fire size, etc"
		var total_windows = 8
		var fire_windows = 5
	var buildings = Buildings.new()
	class Score:
		var help = "how many points the player has"
		var rate = 10
	var score = Score.new()
	var api = """
difficulty
	help
	fire
		help
		burn
			rate
			spread
		disperse
			help
			rate
			size
			damage
	insurance
		help
		penalty
		reward
		bonus
	buildings
		total_windows
		fire_windows
	score
		help
		rate
	api
"""
var difficulty = Difficulty.new()








