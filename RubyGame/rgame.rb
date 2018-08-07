# A simple "Triangle Game" that allows you to move a Roguelike '@' around the
# window (and off of it). This is a working example on MacOS 10.12 as of Dec 16, 2017.
# This combines some of the Ruby2D tutorial code with keypress management
# that actually works.
# 
# Keys: hjkl: movement, q: quit
# 
# To run: ruby triangle-game.rb after installing the Simple2D library and Ruby2D Gem.
#
# Author: Douglas P. Fields, Jr.
# E-mail: symbolics@lisp.engineer
# Site: https://symbolics.lisp.engineer/
# Copyright 2017 Douglas P. Fields, Jr.
# License: The MIT License

require 'ruby2d'
require './enemy.rb'
require './player.rb'


def collision(player,enemies)
	puts enemies.inspect
	enemies.each_with_index do |((xc,yc),(x,y)),index|
		d = Math.sqrt(((2*player.body.x+player.body.size)/2-xc)**2+
			((2*player.body.y-player.body.size)/2+player.body.size - yc)**2)
		dpc = Math.sqrt((player.body.x-(2*player.body.x+player.body.size)/2)**2 +
			(player.body.y-((2*player.body.y-player.body.size)/2+player.body.size))**2)
		dec = Math.sqrt((x-xc)**2 +(y-yc)**2)
		#puts dec
		if (d < dpc + dec) 
			return index
		end
	end
	return -1
end

def fight(player,enemy)
	on :key_down do |e|
		puts "test"
	end
	puts " NOOOOO " 
	if(player.current_hp > 0 || (enemy.current_hp > 0 ) ) 
		fight(player,enemy)
	end
end

set title: "Triangle Game"
 txt = Text.new(x: 25, y: 50, text: 'hello!', size: 20, font: '/usr/share/fonts/opentype/noto/NotoSansCJK-Bold.ttc')
 txt.z = 20
 txt.color = 'fuchsia'
player = Player.new
player.start
width = get :width
height = get :height
enemies = Array.new
centers = Array.new

i = 0
while i<rand(1..10) do 
	b = rand(15..width-15)
	c = rand(15..height-15)
		enemies.push(Enemy.new(b,c))
		centers.push([[(2*b+enemies.last.body.size)/2,(2*c-enemies.last.body.size)/2+enemies.last.body.size],[b,c]])
		i+=1
	end
puts centers.inspect
centers.each do |(xc,yc),(x,y)|
	Square.new(x:xc ,y:yc,z:2 , size: 2, color:'blue')
end

tick = 0
update do 
	
	if tick % 10 == 0
		ok = true 
		i_of_collision = collision(player,centers)
				if(i_of_collision != -1 )
					player.stop
					fight(player,enemies[i])
							on :key_down do |e|
								if(e.key=='u') then player.start; txt.remove
									elsif (e.key == 'p') then ok = false
								end

							end
					end
				
			
	end 
 tick+=1
end
show