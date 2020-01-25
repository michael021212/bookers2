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
end
