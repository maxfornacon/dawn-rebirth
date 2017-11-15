class RpgCharsController < ApplicationController
	before_action :authenticate_user!

	def index
		@chars = current_user.rpg_chars.all
		@team = current_user.rpg_chars.where(team: true)
	end

	def new
		@rpg_char = current_user.rpg_chars.build
	end

	def create
		@chars = current_user.rpg_chars.all
		@rpg_char = current_user.rpg_chars.build(rpg_chars_params)
		
		@chars.each do |c|
			if @rpg_char.name == c.name
				@exists = true
				break
			end
		end
		if @exists == true
			redirect_to new_rpg_char_path, alert: "Du besitzt diesen Charakter schon!"
		else
			if @rpg_char.save
				redirect_to rpg_chars_path
			else
				render 'new'
			end
		end
		
	end

	def show

	end

	def train
		@char = RpgChar.find(params[:id])
	end

	def team
		@team = current_user.rpg_chars.where(team: true)
		@char = RpgChar.find(params[:id])
		if @char.team == true
			@char.update_attribute :team, false
		else
			if @team.count < 4
				@char.update_attribute :team, true
				redirect_to :back
			else
				redirect_to :back, alert: "Dein Team ist voll!"
			end
		end

	end

	private
		def rpg_chars_params
			params.require(:rpg_char).permit(:name, :team, :xp)
		end
end
