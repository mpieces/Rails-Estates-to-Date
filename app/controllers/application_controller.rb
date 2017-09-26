class ApplicationController < ActionController::Base
   # makes methods available to views:
   helper_method :current_user, :logged_in?, :admin?

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # Returns the current logged-in user, if any.
  def current_user
    current_user ||= User.find_by(id: session[:user_id])
  end

  # Returns T if the user is logged in; F otherwise.
  def logged_in?
    !current_user.nil?
  end

  def admin?
    current_user && current_user.admin?
  end

end
