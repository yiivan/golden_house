class Memo < ActiveRecord::Base
  belongs_to :user
  belongs_to :book

  has_many :extra_memos, dependent: :destroy
  accepts_nested_attributes_for :extra_memos,
                                reject_if:     :all_blank,
                                allow_destroy: true

  has_many :likes, dependent: :destroy
  has_many :liking_users, through: :likes, source: :user

  validates :public, inclusion: {in: [true, false]}
  validates :body, presence: true

  def like_for(user)
    likes.find_by_user_id user
  end
end
