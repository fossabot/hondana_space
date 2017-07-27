class HondanasController < ApplicationController
  before_action :set_hondana, only: [:show, :edit, :update, :destroy]

  def index
    @hondanas = Hondana.all.where(organisation_id: organisation.id)
  end

  def show
  end

  def new
    @hondana = Hondana.new
  end

  def edit
  end

  def create
    @hondana = Hondana.new(hondana_params)
    @hondana.organisation = organisation

    if @hondana.save
      redirect_to @hondana
    else
      render :new
    end
  end

  def update
    if @hondana.update(hondana_params)
      redirect_to @hondana, notice: "Hondana was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @hondana.destroy
    redirect_to hondanas_url, notice: "Hondana was successfully destroyed."
  end

  private
    def set_hondana
      @hondana = Hondana.find_by!(id: params[:id], organisation_id: organisation.id)
    end

    def hondana_params
      params.require(:hondana).permit(:name)
    end
end
