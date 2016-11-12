class HomeController < ApplicationController

	def index
		@pin = Pin.all.order("created_at DESC")
		@count
	end
end
