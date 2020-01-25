class FavoritesController < ApplicationController
  def create
    favorite = current_user.favorites.build(book_id: params[:book_id])
    favorite.save
    if params[:page]
      redirect_to book_path(params[:book_id])
    else
      redirect_to books_path
    end
  end

  def destroy
    favorite = Favorite.find_by(book_id: params[:book_id], user_id: current_user.id)
    favorite.destroy
    if params[:page]
      redirect_to book_path(params[:book_id])
    else
      redirect_to books_path
    end
  end
end
