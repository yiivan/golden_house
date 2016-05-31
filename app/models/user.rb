class User < ActiveRecord::Base
  has_secure_password

  has_many :memos, dependent: :destroy
  has_many :books, through: :memos

  has_many :favorites, dependent: :destroy
  has_many :favorite_books, through: :favorites, source: :book

  has_many :likes, dependent: :destroy
  has_many :liked_memos, through: :likes, source: :memo
   
  validates :username,   presence: true, uniqueness: true
  validates :first_name, presence: true
  validates :last_name,  presence: true

  VALID_EMAIL_REGEX = /\A([\w+\-]\.?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, uniqueness: true, presence: true, format: VALID_EMAIL_REGEX

  def full_name
    "#{first_name} #{last_name}"
  end
end
