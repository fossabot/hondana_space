class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def organisation
    Organisation.find_by!(subdomain: request.subdomain)
  end
end
