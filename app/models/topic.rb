class Topic < ApplicationRecord
  belongs_to :end_user
  has_many :posts, dependent: :destroy
  has_many :books, dependent: :destroy
  validates :title, {presence: true, length: {maximum: 100}}
  validates :status, presence: true
end
