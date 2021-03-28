class Tournament < ApplicationRecord
  belongs_to :end_user
  has_many :participants

  validates :title, {presence: true, length: {maximum: 100}}
  validates :content, {presence: true, length: {maximum: 2000}}
  validates :result, length: {maximum: 2000}
  validates :max, presence: true, numericality: true
end
