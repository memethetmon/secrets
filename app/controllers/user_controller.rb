class UserController < ApplicationController
	before_action :require_login, except: [:new, :create]
	before_action :require_correct_user, only: [:show, :edit, :update, :destroy]

	def show
    	@user = User.find(params[:id])
    	@secrets = Secret.all
	end

	def new
		render :new
	end

	def create
		user = User.new(user_params)
		if user.save
			session[:user_id] = user.id
			redirect_to "/user/#{user.id}"
		else
			flash[:errors] = user.errors.full_messages
			redirect_to :back
		end
	end

	def edit
		@user = User.find(params[:id])
	end
	
	def update
		@user = User.find(params[:id])
	    if @user.update(user_params)
	      redirect_to "/user/#{@user.id}"
	    else
	      flash[:errors] = @user.errors.full_messages
	      redirect_to :back
	    end
	end

	def destroy
	    user = User.find(params[:id])
	    user.destroy
	    session[:user_id] = nil
	    redirect_to '/session/new'  
	end

	private
		def user_params
			params.require(:user).permit(:name, :email, :password, :password_confirmation)
		end
end