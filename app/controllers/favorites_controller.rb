class FavoritesController < ApplicationController
  def create
    favorite = current_user.favorites.build(book_id: params[:book_id])
    favorite.save
    @book = Book.find(params[:book_id]) # Ajaxリクエストによりcreateが実行され、このアクションに対応するcreate.js.erbを自動でrenderされる為↓
                                        # 、render先で使う@bookを渡す
    # render 'books/favorite.js.erb'
    # if params[:page]
    #   redirect_to book_path(params[:book_id])
    # else
    #   redirect_to books_path
    # end

  end

  def destroy
    favorite = Favorite.find_by(book_id: params[:book_id], user_id: current_user.id)
    favorite.destroy
    @book = Book.find(params[:book_id]) # Ajaxリクエストによりdestroyが実行され、このアクションに対応するdestroy.js.erbを自動でrenderされる為↓
                                        # 、render先で使う@bookを渡す
    # render 'books/favorite.js.erb' # 別のjs.erbを指定すればそれをrenderさせることもできる
    # if params[:page]
    #   redirect_to book_path(params[:book_id])
    # else
    #   redirect_to books_path
    # end
    # head :no_content # 非同期にするためボディが空のレスポンスを返す
  end
end
