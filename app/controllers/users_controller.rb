#Controls User methods

class UsersController < ApplicationController

  #creates an instance variable named @user to be used by the new view's form
  def new
    @user = User.new
  end

  def confirm

    #confirm that a new user wants to be created with the corresponding attributes from the params hash
    @user = User.new
    @user.name = params[:user][:name]
    @user.email = params[:user][:email]
    @user.password = params[:user][:password]
    @user.password_confirmation = params[:user][:password_confirmation]

  end

  def create

    #create a new user with new and then set the corresponding attributes from the params hash
    @user = User.new
    @user.name = params[:user][:name]
    @user.email = params[:user][:email]
    @user.password = params[:user][:password]
    @user.password_confirmation = params[:user][:password_confirmation]

    #save the new user to the database; add a flash message and redirect the user to the root path if save successful, display error and render new view if not
    if @user.save
      flash[:notice] = "Welcome to Bloccit #{@user.name}!"
      create_session(@user)
      redirect_to root_path
    else
      flash.now[:alert] = "There was an error creating your account. Please try again."
      render :new
    end

  end

end
