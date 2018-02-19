class SessionsController < ApplicationController

  def new
  end

  def create
    #search the database for a user with the specified email address in the  params hash; use downcase to normalize the email address since addresses stored in the database are lowercase strings
    user = User.find_by(email: params[:session][:email].downcase)

    #verify that user is not nil and that the password in the params hash matches specified password; conditional statement will exit early if user is  nil because it checks for that first
    if user && user.authenticate(params[:session][:password])
      create_session(user)
      flash[:notice] = "Welcome, #{user.name}!"
      redirect_to root_path
    else
      flash.now[:alert] = 'Invalid email/password combination'
      render :new
    end
  end

  def destroy
    #logs the user out by calling destroy_session(current_user), flashes a notice that they've been logged out, and redirects them to root_path
    destroy_session(current_user)
    flash[:notice] = "You've been signed out, come back soon!"
    redirect_to root_path
  end

end
