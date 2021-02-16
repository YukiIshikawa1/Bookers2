class BooksController < ApplicationController
    def new
    @book = Book.new
    end

  def create
    @book =  Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(@book)
  end

  def index
    @book =  Book.all
  end

  def show
   @book =  Book.find(params[:id])
  end

  def update
  
  end
  
  def destroy
    @book =  Book.find(params[:id])
    @book.destroy
    redirect_to book_path
  end

  private

  def book_params
    params.require(:book).permit(:book_name, :caption,)
  end
end
