class OauthsController < ApplicationController
  skip_before_action :require_login, raise: false

  def oauth
    login_at(auth_params[:provider], { state: auth_params[:state] })
  end

  def callback
    provider = auth_params[:provider]
    subdomain = auth_params[:state]
    if @user = login_from(provider)
      subdomain = @user.organisation.subdomain
      redirect_to redirect_url(subdomain), notice: "Logged in from #{provider.titleize}!"
    else
      begin
        @user = create_from(provider)
        organisation = Organisation.find_by(subdomain: subdomain)
        @user.update!(organisation: organisation)
        reset_session
        auto_login(@user)
        redirect_to redirect_url(subdomain), notice: "Logged in from #{provider.titleize}!"
      rescue => e
        Rails.logger.error(e)
        redirect_to root_path, alert: "Failed to login from #{provider.titleize}!"
      end
    end
  end

  def destroy
    logout
    redirect_to root_path, notice: "Logged out!"
  end

  private
  def auth_params
    params.permit(:code, :provider, :state)
  end

  def redirect_url(subdomain)
      if Rails.env.development?
        "http://#{subdomain}.loopback.jp:3000"
      else
        root_path
      end
  end
end
