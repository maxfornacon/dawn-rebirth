class FriendshipsController < ApplicationController
	def create
	  @friendship = current_user.friendships.build(:friend_id => params[:friend_id])
	  if @friendship.save
	    flash[:notice] = "erfolgreich gefolgt"
	    redirect_to @friendship.friend
	  else
	    flash[:error] = "Folgen verhindert!"
	    redirect_to root_path
	  end
	end

	def destroy
	  @friendship = current_user.friendships.find(params[:id])
	  @friendship.destroy
	  flash[:notice] = "Du folgst nicht mehr!"
	  redirect_to root_path
	end
end
