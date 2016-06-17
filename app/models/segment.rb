class Segment < ActiveRecord::Base
  belongs_to :memo

  validates :title, presence: true
end
