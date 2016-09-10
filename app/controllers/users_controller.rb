class UsersController < ApplicationController
	before_action :authenticate_user!
	before_action :find_user, only: [:show, :edit, :update, :about]

	def index
		@users = User.search(params[:search])
	end

	def show
		@pin = @user.pins.all.order("created_at DESC")
		begin
			@guild = Guild.find(@user.guild_id)
		rescue
		end
	end

	def markdown
	end

	def about
		if @user.guildmember?
			@guild = Guild.find(@user.guild_id)
		end
	end

	def edit
	end

	def update
		if @user.update(about_params)
			redirect_to about_path(@user), notice: "Profil bearbeitet."
		else
			render 'edit'
		end
	end

	private

		def about_params
			params.require(:user).permit(:status, :favanime, :favmanga, :bio, :twitter, :facebook, :instagram, :askfm, :snapchat, :googleplus)
		end

		def find_user
			@user = User.find(params[:id])
		end
end
