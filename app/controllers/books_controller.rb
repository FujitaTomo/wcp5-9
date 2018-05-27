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
    if book.save
    redirect_to user_path(current_user)
    else
    redirect_to user_path(current_user), warning:"文字制限を超えています"
  end
  end

  def edit
    @book = Book.find_by(id: params[:id])
    if @book == nil
      redirect_to user_path(current_user), warning:"存在しない本を編集する事はできません"

    elsif @book.user_id != current_user.id
      redirect_to book_path(@book), warning: "他のユーザーの投稿を編集する事はできません"
    end
  end

  def update
    book = Book.find(params[:id])
    if book.update(book_params)
    redirect_to book_path(book.id)
    else
    redirect_to edit_book_path(book.id), warning: "文字制限を超えています"
  end
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
