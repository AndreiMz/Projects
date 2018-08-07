require './entity'
require 'ruby2d'

class Enemy < Entity 
	def initialize(x,y)
		super()
		@body = Square.new(color: 'red')
		@body.x = x 
		@body.y = y
		@body.z = 2
		@body.size = rand(15..25)
		@loot = Array.new
	end
	attr_accessor :loot, :body
end