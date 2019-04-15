class V1::SessionsController < ApplicationController

	def create
		@user = User.find_by(email: params[:email])

		if @user.valid_password?(params[:password])
			render :create, status: :created
		else
			head(:unauthorized)
		end
	end

	def destroy
		user = User.find params[:id]
		user.authentication_token = nil
		if user.save
			head(:ok)
		else
			head(:unauthorized)
		end
	end

end
