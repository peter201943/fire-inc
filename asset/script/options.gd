extends Node




class Player:
	class Mouse:
		var sensitivity = 0.03
		class X:
			var sensitivity_offset = +0.01
		class Y:
			var sensitivity_offset = -0.01
		var x = X.new()
		var y = Y.new()
	class Move:
		var speed = 10
	var mouse = Mouse.new()
	var move = Move.new()
var player = Player.new()




class Difficulty:
	class Fire:
		class Burn:
			var rate = 0.5
			var spread = 0.5
		var burn = Burn.new()
	var fire = Fire.new()
var difficulty = Difficulty.new()








