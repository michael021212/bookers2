class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show, :index, :edit, :update, :user_params]
  def home
    render :home
  end

  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = @user.books.all
  end

  def index
    @user = current_user
    @book = Book.new
    @users = User.all

  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id), notice:'You have updated user successfully.'
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end

