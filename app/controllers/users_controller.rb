class UsersController < ApplicationController

  before_action :authenticate_user!

  def index
    @user = User.find(current_user.id)
    @users = User.all
    @book = Book.new
  end

  def show
  	@user = User.find(params[:id])
  	@books = @user.books
  	@book = Book.new
  end

  def edit
    @user = User.find(params[:id])
    if @user.id != current_user.id
      redirect_to user_path(@user)
    end
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user)
  end

   private
    def user_params
      params.require(:user).permit(:name, :user_image, :introduction)
    end
end
