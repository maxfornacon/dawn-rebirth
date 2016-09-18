class MessagesController < ApplicationController
	def destroy
		@message = Message.find(params[:id])
		@message.destroy
	end
end
