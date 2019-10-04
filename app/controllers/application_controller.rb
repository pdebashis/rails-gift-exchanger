class ApplicationController < ActionController::Base

  def contact
    render "static pages/contact"
  end

  def terms_of_use
    render "static pages/terms_of_use"
  end

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user
end
