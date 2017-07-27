class CollectionsController < ApplicationController
  before_action :set_organisation, only: [:show, :new, :create]

  def show
    @collections = Collection.where(id: params[:id], organisation_id: @organisation.id)
  end

  def new
    @hondanas = Hondana.where(organisation_id: @organisation.id)
    @collection = Collection.new
  end

  def create
    book = Book.find_or_create_by_isbn(collection_params[:isbn])
    @collection = Collection.new(organisation_id: @organisation.id, book_id: book.id)

    if @collection.save
      redirect_to @collection, notice: "Collection was successfully created."
    else
      render :new
    end
  end


  private
    def collection_params
      params.require(:collection).permit(:id, :isbn, :hondana_id)
    end
end
