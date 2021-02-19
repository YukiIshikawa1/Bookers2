class BooksController < ApplicationController
   before_action :correct_user, only: [:edit,:update,:destroy]


    def new
      @book = Book.new
      flash[:notice] = "Book was successfully created."
      redirect_to book_path(@book)
    end

  def create
      @book =  Book.new(book_params)
      @book.user_id = current_user.id
    if  @book.save
        flash[:notice] = "You have created book successfully."
        redirect_to book_path(@book)
    else
        @user = User.find_by(id: current_user.id)
        @books =  Book.all
        render :index
    end
  end

  def index
     @book = Book.new
     @books =  Book.all
     @user = User.find_by(id: current_user.id)
  end

  def show
    @book = Book.new
    @a =  Book.find(params[:id])
    @user = User.find(@a.user.id)
  end

  def update
     @book = Book.find(params[:id])
    if @book.update(book_params)
       flash[:notice] =   "You have updated book successfully."
       redirect_to book_path(@book.id)
    else
      render :edit
    end
  end

  def edit
     @book = Book.find(params[:id])
     @user = User.find_by(id: current_user.id)
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private

  def correct_user
     @book= Book.find(params[:id])
    if @book.user_id != current_user.id
      redirect_to books_path
    end
  end

  def book_params
    params.require(:book).permit(:title, :body)
  end
end

