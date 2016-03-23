class LikesController < ApplicationController
	before_action :require_login, only: [:create, :destroy]
	# before_action :require_correct_user, only: [:destroy]

	def create
  		like = Like.new(secret_id: params['secret_id'], user_id: current_user.id)
		if like.save
			redirect_to "/secrets"
		else
			flash[:errors] = like.errors.full_messages
			redirect_to :back
		end
	end

	def destroy
		like = Like.find_by "secret_id = ?", params[:id]
	    if like.user == current_user
	    	like.destroy
	    	redirect_to "/secrets"
	    else
	    	redirect_to "/user/#{current_user.id}"
	    end
	end  
end
