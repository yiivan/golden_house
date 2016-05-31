class Like < ActiveRecord::Base
  belongs_to :user
  belongs_to :memo

  validates :user_id, uniqueness: {scope: :memo_id}
end
