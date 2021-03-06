class BooksController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user,only: [:edit]

  def create
    @book = Book.new(book_params)

    @book.user_id = current_user.id
    if @book.save
      redirect_to @book, notice: 'You have creatad book successfully.'
    else
      @books = Book.all
      render :index
    end
  end

  def index
    @books = Book.all
    @user_id = current_user.id

    @book = Book.new

  end

  def show
    @book = Book.find(params[:id])
    @books = Book.all
    @book_new = Book.new
    # @comment = current_user.comments.build(book_id: params[:book_id])
    @comment = Comment.new
  end

  def ensure_correct_user
    @book = Book.find(params[:id])
    if @book.user_id != current_user.id
      redirect_to books_path
    end

  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
    redirect_to book_path(@book.id), notice: "You have updated book successfully."
    else
    render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    if @book.destroy
    redirect_to books_path
    else
      render :edit
    end
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
