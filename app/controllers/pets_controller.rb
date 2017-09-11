class PetsController < ApplicationController
	before_action :authenticate_user!

	def new
		@pet = current_user.build_pet
	end

	def create
		@pet = current_user.build_pet(pet_params)

		if @pet.save

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
