class HomeController < ApplicationController
  def index
    @organisation = Organisation.new
  end
end
