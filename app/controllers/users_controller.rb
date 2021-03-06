class UsersController < ApplicationController
	before_action :authenticate_user!
	before_action :find_user, only: [:show, :edit, :update, :about, :anime_kanban, :destroy]
	before_action :find_guild, only: [:show, :about, :rank_up, :rank_down, :kick, :anime_kanban, :edit]

	def index
	  @users = User.all
	  if params[:search]
	    @users = User.search(params[:search]).order("created_at DESC")
	  else
	    @users = User.all.order("created_at DESC")
	  end
	end

	def show
		@pin = @user.pins.all.order("created_at DESC")
		@pet = @user.pet
	end

	def about
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

	def destroy
		if @user.destroy
			redirect_to admin_users_path, notice: "User destroyed"
		else
			redirect_to admin_users_path, alert: "User NOT destroyed"
		end
	end

	def rank_up
		if current_user.owner? and current_user.guild_id == @guild.id
			user = User.find(params[:user_id])
			if user.guildrank < 15
				user.guildrank = Useruser.guildrank + 1
				user.save
				redirect_to guilds_members_path(@guild), notice: "Rang erhöht"
			else
				redirect_to guilds_members_path(@guild), alert: "nicht möglich"
			end
		end		
	end
	def rank_down
		if current_user.owner? and current_user.guild_id == @guild.id
			user = User.find(params[:user_id])
			if user.guildrank > 11
				user.guildrank = user.guildrank - 1
				user.save
				redirect_to(guilds_members_path(@guild), notice: "Rang erniedrigt")
			else
				redirect_to guilds_members_path(@guild), alert: "nicht möglich"
			end
		end		
	end
	def kick
		if current_user.owner? and current_user.guild_id == @guild.id
			user = User.find(params[:user_id])
			user.update_attribute :guild_id, false
			user.update_attribute :guildmember, false
			redirect_to guilds_members_path(@guild), alert: "gekickt"
		end
	end

	def markdown
	end

	def anime_kanban
		@to_watch = @user.animes.where(state: "to_watch")
    @watching = @user.animes.where(state: "watching")
    @watched = @user.animes.where(state: "watched")
	end

	def make_mod
		if current_user.admin?
			user = User.find(params[:id])
			user.update_attribute :mod, true
			redirect_to admin_users_path, notice: "befördert"
		end
	end
	def undo_mod
		if current_user.admin?
			user = User.find(params[:id])
			user.update_attribute :mod, false
			redirect_to admin_users_path, notice: "degradiert"
		end
	end
	private

		def about_params
			params.require(:user).permit(:status, :favanime, :favmanga, :bio, :twitter, :facebook, :instagram, :askfm, :snapchat, :googleplus)
		end

		def find_user
			@user = User.find(params[:id])
		end

		def find_guild
			begin
				@guild = Guild.find(@user.guild_id)
			rescue
			end
		end
end
