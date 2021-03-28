class Tournament < ApplicationRecord
  belongs_to :end_user
  has_many :participants

  validates :title, {presence: true, length: {maximun: 100}}
  validates :content, {presence: true, length: {maximun: 2000}}
  validates :result, length: {maximun: 2000}
  validates :max, presence: true, numericality: true
end
