class Favorite < ActiveRecord::Base
  belongs_to :user
  belongs_to :book

  validates :user_id, uniqueness: {scope: :book_id}
end
