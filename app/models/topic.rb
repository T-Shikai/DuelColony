class Topic < ApplicationRecord
  belongs_to :end_user
  has_many :posts

  validates :title, presence: true
end
