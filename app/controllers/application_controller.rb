class ApplicationController < ActionController::Base
  def home
  	render 'static pages/home'
  end

  def contact
    render "static pages/contact"
  end

  def terms_of_use
    render "static pages/terms_of_use"
  end
end
