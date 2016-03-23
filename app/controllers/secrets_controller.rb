class SecretsController < ApplicationController
  before_action :require_login, only: [:index, :create, :destroy]
  def index
  	@secrets = Secret.all
    @likes = Like.all
  end

  def create
  	secret = Secret.new(content: secret_params['content'], user: current_user)
		if secret.save
      flash["success"] = "Secret added!"
			redirect_to "/user/#{current_user.id}"
		else
			flash[:errors] = secret.errors.full_messages
			redirect_to :back
		end
  end

  def destroy
    secret = Secret.find(params[:id])
    secret.destroy if secret.user == current_user
    redirect_to "/user/#{current_user.id}"
  end

  private
  def secret_params
    params.require(:secret).permit(:content, :user_id)
  end

end
