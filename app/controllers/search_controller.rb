class SearchController < ApplicationController
  def search
    if params[:select] == '1'
      @users = User.search(params[:search], params[:select_type])
    else
      @books = Book.search(params[:search], params[:select_type])
    end
  end
end
