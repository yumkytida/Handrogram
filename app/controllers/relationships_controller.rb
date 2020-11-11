class RelationshipsController < ApplicationController
	def create
		  @user = User.find(params[:follow_id])
		  current_user.follow(@user)
	    redirect_to users_path
	end

	def destroy
		@user = User.find(params[:follow_id])
    	following = current_user.unfollow(@user)
	    following.destroy
	    redirect_to users_path
    end

end