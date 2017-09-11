class PetsController < ApplicationController
	before_action :authenticate_user!

	def new
		@pet = current_user.build_pet
	end

	def create
		@pet = current_user.build_pet(pet_params)

		if @pet.save
			if @pet.pettype == "cat"
				current_user.decrement!(:score, by = 500)
			elsif @pet.pettype == "spider"
				current_user.decrement!(:score, by = 1000)
			elsif @pet.pettype == "kohle"
				current_user.decrement!(:score, by = 10000)
			end
			redirect_to current_user, notice: "erfolgreich gekauft"
		else
			render 'new'
		end
	end

	private

		def pet_params
			params.require(:pet).permit(:name, :pettype)
		end
end
