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
    @book = Book.new
    @books =  Book.all
    @user = User.find_by(id: current_user.id)
  end

  def show
   @book = Book.new
   @book =  Book.find(params[:id])
   @user = User.find_by(id: current_user.id)
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to book_path(@book.id)
  end

  def edit
    @book = Book.find(params[:id])
    @user = User.find_by(id: current_user.id)
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to book_path(@book)
  end

  private

  def book_params
    params.require(:book).permit(:title, :body,)
  end
end
