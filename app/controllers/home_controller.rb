class HomeController < ApplicationController
	def index
		@pins = Pin.all.order("popularity ASC").limit(5)
	end
	def infos
	end
end
