class Post < ApplicationRecord
  belongs_to :end_user
  belongs_to :topic
  has_many :likes
  attachment :image

  validates :content, {presence: true, length: {maximum: 500}}
end
