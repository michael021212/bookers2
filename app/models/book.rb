class Book < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :body, presence: true, length: { maximum: 200 }

  has_many :favorites
  has_many :comments

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  def commented_by?(user)
    comments.where(user_id: user.id).exists?
  end

  def comment_user(book)
    @comment_user = User.where(book.comments.user_id).name
  end
end
