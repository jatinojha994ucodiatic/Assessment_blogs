class ApplicationController < ActionController::Base
  skip_authorization_check
  check_authorization unless: :SessionsController
  # check_authorization :unless => :devise_controller?
  # check_authorization :if => :admin_subdomain?

  private
    def admin_subdomain?
      request.subdomain == "admin"
    end


end
