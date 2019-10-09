class ApplicationController < ActionController::Base
  include Clearance::Controller

  def contact
    render "static pages/contact"
  end

  def terms_of_use
    render "static pages/terms_of_use"
  end

end
