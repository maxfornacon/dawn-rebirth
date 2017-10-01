class RpgCharsController < ApplicationController
	before_action :authenticate_user!

	def index
		@chars = current_user.rpg_chars.all
	end

	def new
		@rpg_char = current_user.rpg_chars.build
	end

	def create
		@rpg_char = current_user.rpg_chars.build(rpg_chars_params)

		if @rpg_char.save
			redirect_to rpg_chars_path
		else
			render 'new'
		end
	end

	def train

	end

	def to_team
		@char = Rpg_char.find(params[:id])
		@char.update_attribute :team, true
		respond_to do |format|
    	format.html { redirect_to rpg_chars_path }
    	format.json { head :no_content }
    	format.js   { render :layout => false }
    end
	end

	private
		def rpg_chars_params
			params.require(:rpg_char).permit(:name, :team, :xp)
		end
end
