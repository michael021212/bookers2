class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true, length: { minimum: 2, maximum: 20 }
  validates :introduction, length: { maximum: 50 }
  attachment :profile_image

  has_many :books, dependent: :destroy

  has_many :favorites
  has_many :favorite_books, through: :favorites, source: :book

  has_many :comments
  has_many :comment_books, through: :comments, source: :book

  has_many :active_relationships, class_name: 'Relationship', foreign_key: :following_id
  has_many :followings, through: :active_relationships, source: :follower

  has_many :passive_relationships, class_name: 'Relationship', foreign_key: :follower_id
  has_many :followers, through: :passive_relationships, source: :following

  def followed_by?(user)
    passive_relationships.find_by(following_id: user.id).present?
  end

  def self.search(search, select_type)
    case select_type
    when '1' # 完全一致
      User.where(['name LIKE ?', "#{search}"])
    when '2' # 前方一致
      User.where(['name LIKE ?', "#{search}%"])
    when '3' # 後方一致
      User.where(['name LIKE ?', "%#{search}"])
    else # 部分一致
      User.where(['name LIKE ?', "%#{search}%"])
    end
  end

  include JpPrefecture
  jp_prefecture :prefecture_code

  def prefecture_name
    JpPrefecture::Prefecture.find(code: prefecture_code).try(:name)
  end

  def prefecture_name=(prefecture_name)
    self.prefecture_code = JpPrefecture::Prefecture.find(name: prefecture_name).code
  end
end
