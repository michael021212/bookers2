class CommentsController < ApplicationController
  def create
    # 短い書き方
    @comment = current_user.comments.build(book_id: params[:book_id], body: params[:comment][:body])
    # 基本的な書き方
    # book = Book.find(params[:book_id])
    # @comment = Comment.new(comment_params)
    # @comment.user_id = current_user.id
    # @comment.book_id = book.id
    @comment.save
    redirect_to book_path(params[:book_id])
  end

  def destroy
    @comment = Comment.find(params[:comment_id])
    @comment.destroy
    if params[:page]
      redirect_to user_path(params[:user_id])
    else
      redirect_to book_path(params[:book_id])
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:user_id, :book_id, :body)
    end
end
