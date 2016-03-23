require 'rails_helper'

RSpec.describe LikesController, type: :controller do
	before do
		@user = create_user
		@secret = @user.secrets.create(content: "secret")
		@like = @secret.likes.create(secret_id: @secret.id, user_id: @user.id)
	end
	describe "when not logged in" do
		before do
			session[:user_id] = nil
		end
		it "cannot access create" do
			post :create
			expect(response).to redirect_to('/session/new')
		end
		it "cannot access destroy" do
			delete :destroy, id: @like
			expect(response).to redirect_to('/session/new')
		end
	end

	# describe "when signed in as the wrong user" do
	# 	before do
	#       @wrong_user = create_user 'julius', 'julius@lakers.com'
	#       session[:user_id] = @wrong_user.id
	#       @secret = @user.secrets.create(content: 'Ooops')
	#       @like = @secret.likes.create(secret_id: @secret.id, user_id: @wrong_user.id)
	#     end
	#     it "cannot access destroy" do
	#       delete :destroy, id: @like, user_id: @user
	#       expect(response).to redirect_to("/user/#{@wrong_user.id}")
	#     end
	# end 
end
