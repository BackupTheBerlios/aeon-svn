class UsersController < ApplicationController
  def login
    if request.post?
      if user = User.authenticate(params[:login], params[:password])
        session[:user_id] = user.id
        redirect_to appointments_url
      else
        flash[:notice] = 'Invalid login/password combination'
      end
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to login_url
  end
end
