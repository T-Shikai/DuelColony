class Post < ApplicationRecord
  belongs_to :end_user
  belongs_to :topic
  has_many :likes, dependent: :destroy
  attachment :image

  validates :content, { presence: true, length: { maximum: 500 } }
  validates :status, { presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 2 } }
end
