class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show, :index, :edit, :update, :user_params]
  before_action :ensure_correct_user,only: [:edit]

  def home
    render :home
  end

  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = @user.books.all
    @favorite_books = @user.favorite_books
    @comments = @user.comments
  end

  def index
    @user = current_user
    @book = Book.new
    @users = User.all

  end

  def ensure_correct_user
    @user = User.find(params[:id])
    if @user != current_user
      redirect_to user_path(current_user)
    else
      render :edit
    end
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

  def follows
    user = User.find(params[:id])
    @users = user.followings
  end

  def followers
    user = User.find(params[:id])
    @users = user.followers
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :profile_image, :introduction, :postcode, :prefecture_name, :address_city, :address_street, :address_building)
  end
end
