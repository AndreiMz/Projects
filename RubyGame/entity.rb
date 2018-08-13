class Entity
	def initialize
		@current_hp = 100
		@max_hp = 100
		@attack_power = 0
		@defense = 0
	end
	def attacked(enemy)
		@current_hp -= enemy.attack_power - @defense
		if(@current_hp < 0) 
			current_hp = 0
		end
	end
	def attacking(enemy)
		enemy.current_hp -= enemy.defense - @attack_power
	end

	attr_accessor :current_hp, :max_hp, :attack_power, :defense
end