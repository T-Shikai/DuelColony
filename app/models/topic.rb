class Topic < ApplicationRecord
  belongs_to :end_user
  has_many :posts
  has_many :books
  validates :title, {presence: true, length: {maximun: 100}}
end
