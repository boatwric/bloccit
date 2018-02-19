module SessionsHelper

  #sets user_id on the session object to user.id, which is unique for each user
  def create_session(user)
    session[:user_id] = user.id
  end

  #clear the user id on the session object by setting it to nil; effectively destroys user session because we can't track it via user id any longer
  def destroy_session(user)
    session[:user_id] = nil
  end

  #we won't have to constantly call User.find_by(id: session[:user_id]); current_user is our shortcut to that functionality; finds signed-in user by taking the user id from the session and searching the database for the user in question
  def current_user
    User.find_by(id: session[:user_id])
  end

end
