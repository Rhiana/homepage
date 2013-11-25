class ProfilesController < ApplicationController
  def show
  	  	@user = User.find_by_email(params[:user_id])
  	if @user
  		@todos = @user.todos.all
  		render action: :index
  	else
  		render file: 'public/404', status: 404, formats: [:html]
  	end
  end
end
