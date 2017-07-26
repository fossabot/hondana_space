class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def set_organisation
    @organisation = Organisation.find_by!(subdomain: request.subdomain)
  end
end
