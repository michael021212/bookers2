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

  def self.search(search, select_type)
    case select_type
    when '1' # 完全一致
      Book.where(['title LIKE ?', "#{search}"])
    when '2' # 前方一致
      Book.where(['title LIKE ?', "#{search}%"])
    when '3' # 後方一致
      Book.where(['title LIKE ?', "%#{search}"])
    else # 部分一致
      Book.where(['title LIKE ?', "%#{search}%"])
    end
  end

end
