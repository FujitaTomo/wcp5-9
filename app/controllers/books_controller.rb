class BooksController < ApplicationController
  
  before_action :authenticate_user!

  def index
    @user = User.find(current_user.id)
    @books = Book.all
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user
    @new_book = Book.new
  end

  def create
    book = Book.new(book_params)
    book.user_id = current_user.id
    book.save
    redirect_to user_path(current_user)
  end

  def edit
    @book = Book.find(params[:id])
    if @book.user_id != current_user.id
      redirect_to book_path(@book)
    end
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book.id)
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to user_path(current_user)
  end

 private
    def book_params
      params.require(:book).permit(:title, :body, :user_id)
    end
end
