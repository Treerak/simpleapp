class UsersController < ApplicationController
	def show
		@user = User.find(params[:id])
	end

	def new
		@user = User.new
	end

	def create
		user = User.new(name: params[:user] [:name],
			username: params[:user] [:username],
			password: params[:user] [:password])

		if user.save
			#Todo: redirect to this user (show user)
			redirect_to users_show_path(user.id)

			#puts "1111111111111111111111111"
			#render nothing: true
		else
			redirect_to users_new_path			#puts "2222222222222222222222222"
		end
	end


	def log_in
		@user = User.new
	end

	def create_session

		user = User.where(username: params[:user][:username], 
				password: params[:user][:password])

		if user.count > 0
			redirect_to users_show_path(user[0].id)
		else
			redirect_to users_log_in_path
		end
	end

	
end
