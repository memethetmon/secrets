class SessionController < ApplicationController
	def new
		render :new
	end

	def create
		user = User.find_by(email: params[:email])
		if user && user.authenticate(params[:password])
			session[:user_id] = user.id
			redirect_to "/user/#{user.id}"
		else
			flash[:errors] = ["Invalid Combination"]
			redirect_to :back
		end
	end

	def destroy
		session[:user_id] = nil
		redirect_to '/session/new'
	end
end
