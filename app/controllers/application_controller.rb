class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?, :scroll_bottom, :update_last_seen_at
  after_action :update_user_online

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def require_user
    if !logged_in?
      flash[:alert] = "You must be logged in to perform that action."
      redirect_to login_path
    end
  end

  private

  def update_user_online
    current_user.try :touch
  end

end
