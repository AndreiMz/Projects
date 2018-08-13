require './entity'
require 'ruby2d'

class Player < Entity 
	
	def initialize
		extend Ruby2D::DSL
		super()
		@items = Array.new
		@body = Square.new(size: 50 , color: 'blue', z:10)
		@speed = 3
		@is_moving = 0
		
	end
	def stop
		off(@key_event)
		@is_moving = 0
	end
	def start
		extend Ruby2D::DSL
			if(@is_moving == 0 )
				@is_moving = 1 
				@key_event = on :key_held do |e|
					if e.type == :held
		   				 case e.key
		   					 when 's'
		   					 	if(@body.y + @body.height < 480)
		   						   @body.y += @speed
		 						 end
		   					 when 'w'
		    					if(@body.y - @speed > 0)
								      @body.y -= @speed
		  						end
		    				 when 'a'
		    					if(@body.x - @speed > 0)
		      						@body.x -= @speed
		  						end
		    				 when 'd'
		    					if(@body.x + @body.height < 640)
		          					@body.x += @speed
		  						end
		    				 when 'q'
		      					return "quit"
		    			 end
				     end
				     "continue"
				     
				end
			end
	end

		

	def use_item(slot)
		items[slot].add_effect
	end

	def flee()
	end

	attr_accessor :items , :body
end
