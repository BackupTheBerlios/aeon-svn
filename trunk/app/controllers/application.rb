# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => '397bf371970a602f3805ca7ce33b20ff'

  protected
    def current_user
      return unless session[:user_id]
      @current_user ||= User.find_by_id(session[:user_id])
    end

    helper_method :current_user

    def authenticate
      logged_in? ? true : access_denied
    end

    def logged_in?
      current_user.is_a? User
    end

    helper_method :logged_in?

    def access_denied
      flash[:notice] = "Please log in to continue"
      redirect_to login_url and return false
    end
end
