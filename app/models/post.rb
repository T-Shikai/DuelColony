class Post < ApplicationRecord
  belongs_to :end_user
  belongs_to :topic
  has_many :likes, dependent: :destroy
  attachment :image

  validates :content, {presence: true, length: {maximum: 500}}
  validates :status, presence: true
end
