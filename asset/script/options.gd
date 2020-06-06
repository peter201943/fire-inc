extends Node



class player_data:
	class Mouse:
		var sensitivity = 0.03
		class X:
			var sensitivity = 10
		class Y:
			var sensitivity = 10
		var x = X.new()
		var y = Y.new()
		
	class Move:
		var speed = 10
	
	var mouse = Mouse.new()
	var move = Move.new()

