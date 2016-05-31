class Book < ActiveRecord::Base
  belongs_to :category
  belongs_to :language

  has_many :memos, dependent: :nullify
  has_many :users, through: :memos

  has_many :favorites, dependent: :destroy
  has_many :favoriting_users, through: :favorite, source: :user

  validates :isbn, presence: true, uniqueness: true
  validates :title, presence: true
  validates :author, presence: true
  validates :category, presence: true
  validates :language, presence: true

  mount_uploader :image, ImageUploader

  def favorite_for(user)
    favorites.find_by_user_id user
  end
end
