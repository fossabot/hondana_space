class OrganisationsController < ApplicationController
  def index
    @books = organisation.books.order(created_at: :desc)
  end

  def show
    @organisation = organisation
    @users = User.where(organisation_id: organisation.id)
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
