class CollectionsController < ApplicationController
  def show
    @collection = Collection.find_by!(id: params[:id], organisation_id: organisation.id)
  end

  def new
    @book = Book.new
  end

  def create
    book = Book.find_or_create_by_isbn(book_params[:isbn].gsub("-", ""))
    @collection = Collection.find_or_initialize_by(organisation_id: organisation.id, book_id: book.id)

    respond_to do |format|
      if @collection.save
        format.html { redirect_to @collection, notice: "Collection was successfully created." }
        format.json { render :show, status: :created, location: @collection }
      else
        format.html { render :new }
        format.json { render json: @collection.errors.full_messages.first, status: :unprocessable_entity }
      end
    end
  end


  private
    def book_params
      params.require(:book).permit(:isbn)
    end
end
