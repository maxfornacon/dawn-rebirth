class UpdatesController < ApplicationController
  before_action :authenticate_user!
	before_action :find_update, only: [:edit, :update, :destroy, :show]
	before_action :is_admin?, only: [:new, :create, :edit, :update, :destroy]
  def new
		@update = current_user.updates.build
  end

  def create
		@update = current_user.updates.build(update_params)

		if @update.save
			redirect_to root_path, notice: "erfolgreich"
		else
			render 'new'
		end
  end

  def edit
  end

  def update
		if @update.update(update_params)
			redirect_to root_path, notice: "Update geupdatet"
		else
			render 'edit'
		end
  end

	def destroy
		@update.destroy
		redirect_to root_path
	end

	def show

	end

	private

		def update_params
			params.require(:update).permit(:title, :body, :updatetype)
		end

		def find_update
			@update = Update.find(params[:id]) 
		end

		def is_admin?
			redirect_to root_path unless current_user.admin?
		end

end
