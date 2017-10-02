class AdminController < ApplicationController
	before_action :authenticate_user!
	before_action :check_admin

	def index
	end

	def users
		@users = User.all
	end

	def flags
		@pins = Pin.all.includes(:user)
	end

	def miner

	end
	
	private
		def check_admin
			unless current_user.admin?
				redirect_to root_path, alert: "Du bist kein Admin!"
			end
		end
end
