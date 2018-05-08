class UsersController < ApplicationController	

	def index
		@users = User.all
	end

	def edit
		@user = User.find(params[:id])
		@roles = Role.all
	end

	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
			p "fdshfsjf"
			redirect_to users_path
		else
			render 'edit'
		end		
	end

	private
		def user_params
			p "-------------------"
			params.require(:user).permit(:name,role_users_attributes: [:id, :user_id,:role_id,:_destroy])
		end

end	


# role_users_attributes: [:id, :user_id,:role_id,:_destroy]