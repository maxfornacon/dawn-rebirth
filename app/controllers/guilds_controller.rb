class GuildsController < ApplicationController
	before_action :authenticate_user!
	before_action :find_guild, only: [:show, :edit, :update, :destroy, :join, :leave, :members, :chat]

	def index
		@guilds = Guild.all.order("created_at DESC")
	end

	def show
		@user = User.all.order("created_at DESC")

	end

	def members 
		@user = User.all.order("created_at DESC")
	end

	def chat
		@chat_room = Guild.includes(:messages).find_by(id: params[:id])
		@message = Message.new
	end

	def join
		if current_user.score >= 100
			current_user.update_attribute :guild_id, @guild.id
			current_user.update_attribute :guildrank, 11
			current_user.update_attribute :guildmember, true
			current_user.decrement!(:score, by = 100)
			@guild.increment!(:score, by = 100)
			redirect_to @guild, notice: "Du bist der Gilde beigetreten!"
		else
			redirect_to @guild, alert: "Du hast nicht genügend Chakrataler um dieser Gilde beizutreten!"
		end
	end

	def leave
		current_user.update_attribute :guild_id, false
		current_user.update_attribute :guildmember, false
		redirect_to current_user, notice: "Du hast die Gilde verlassen!"
	end

	def new
		if current_user.score >= 1000
			@guild = current_user.guilds.build
		else
			redirect_to current_user, alert: "Du hast nicht genügen Chakrataler um eine Gilde zu gründen!"
		end
	end

	def create
		@guild = current_user.guilds.build(guild_params)


		if @guild.save
			current_user.update_attribute :owner, true
			current_user.update_attribute :guild_id, @guild.id
			current_user.decrement!(:score, by = 1000)
			current_user.update_attribute :guildrank, 14
			@guild.increment!(:score, by = 1000)
			redirect_to @guild, notice: "Gilde erfolgreich gegründet!"
		else
			render 'new'
		end
	end

	def destroy
		@guild.destroy
		current_user.update_attribute :owner, false
		redirect_to current_user

		@users = User.all
		@users.each do |user|
			if user.guild_id == @guild.id
				user.update_attribute :guild_id, false
				user.update_attribute :guildmember, false
			end
		end
	end

	def edit
	end

	def update
		if @guild.update(guild_params)
			redirect_to @guild, notice: "Guilde aktualisiert"
		else
			render 'edit'
		end
	end

	private

	def guild_params
		params.require(:guild).permit(:name, :description, :image, :guildtype)
	end

	def find_guild
		@guild = Guild.find(params[:id])
	end
end
