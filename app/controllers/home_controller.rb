class HomeController < ApplicationController
	def index
		@pins = Pin.all.order("popularity ASC").limit(5)
		@posts = Post.all.order("created_at DESC").limit(3)
	end
	def infos
	end
end
