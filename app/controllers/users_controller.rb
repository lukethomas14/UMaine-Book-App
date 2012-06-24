class UsersController < ApplicationController
	def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

	def new
	  @user = User.new
	end

	def create
	  @user = User.new(params[:user])
	  if @user.save
	    session[:user_id] = @user.id
	    redirect_to root_url, notice: "Thank you for signing up!"
	  else
	    render "new"
	  end
  end
end
