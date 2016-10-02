class PinsController < ApplicationController
	before_action :authenticate_user!
	before_action :find_pin, only: [:show, :edit, :update, :destroy, :upvote, :downvote]
	
  def index
		@pins = Pin.all.order("created_at DESC")
  end

  def show
  end

  def new
		@pin = current_user.pins.build
  end

  def create
		@pin = current_user.pins.build(pin_params)

		if @pin.save
			current_user.increment!(:score, by = 5)
			redirect_to current_user, notice: "erfolgreich gepinnt"
		else
			render 'new'
		end
  end

  def edit
  end

  def update
		if @pin.update(pin_params)
			redirect_to @pin, notice: "Pin geupdatet"
		else
			render 'edit'
		end
  end

	def destroy
		@pin.destroy
		current_user.decrement!(:score, by = 5)
		redirect_to current_user
	end

	def upvote
		@user = User.find(@pin.user)
		@pin.upvote_from current_user
		@user.increment!(:score, by = 1)
		redirect_to @user
	end

	def downvote
		@user = User.find(@pin.user)
		@pin.downvote_from current_user
		redirect_to @user
	end

	private

	def pin_params
		params.require(:pin).permit(:description, :image)
	end

	def find_pin
		@pin = Pin.find(params[:id])
	end
end
