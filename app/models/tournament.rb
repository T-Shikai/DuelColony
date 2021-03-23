class Tournament < ApplicationRecord
  belongs_to :end_user
  has_many :participants

  validates :title, presence: true
  validates :content, presence: true
  validates :max, presence: true, numericality: true
end
