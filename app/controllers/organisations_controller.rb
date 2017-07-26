class OrganisationsController < ApplicationController
  before_action :set_organisation, only: [:show]

  def show
  end

  def create
    @organisation = Organisation.new(organisation_params)

    if @organisation.save
      redirect_to "/oauth/google?state=#{organisation_params[:subdomain]}"
    else
      render "home/index"
    end
  end


  private
    def organisation_params
      params.require(:organisation).permit(:subdomain)
    end
end
