class V1::RegisterationsController < ApplicationController

	def create
		@user = User.new(email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
		if @user.save
			render :create
		else
			head(:unprocessable_entity)
		end
	end

	def update
		@user = User.find params[:id]
		if @user.valid_password?(params[:old_password])
			if @user.update(password: params[:new_password], password_confirmation: params[:new_password_confirmation])
				render :update
			else
				head(:unprocessable_entity)
			end
		else
			head(:unauthorized)
		end
	end
end
