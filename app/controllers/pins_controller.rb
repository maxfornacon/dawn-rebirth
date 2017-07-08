class PinsController < ApplicationController
	before_action :authenticate_user!
	before_action :find_pin, only: [:show, :edit, :update, :destroy, :upvote, :downvote, :flag]
	
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
		@pin.upvote_by current_user
		@user.increment!(:score, by = 1)
		if @pin.get_upvotes.size > @pin.get_downvotes.size
			@pin.popularity = ((Time.now - @pin.created_at)).to_i / @pin.get_upvotes.size
			@pin.save
		end
		respond_to do |format|
      format.html { redirect_to :back }
      format.json { head :no_content }
      format.js   { render :layout => false }
    end

	end

	def downvote
		@user = User.find(@pin.user)
		@pin.downvote_by current_user

		if @pin.get_downvotes.size > @pin.get_upvotes.size
			@pin.popularity = ((Time.now - @pin.created_at)).to_i / @pin.get_downvotes.size
			@pin.save
		end
		redirect_to :back
	end

	def flag
		@user = User.find(@pin.user)
		@pin.flags.create
		redirect_to :back
	end
	private

		def pin_params
			params.require(:pin).permit(:heading, :subheading, :description, :image, :pintype)
		end

		def find_pin
			@pin = Pin.find(params[:id]) 
		end
end
