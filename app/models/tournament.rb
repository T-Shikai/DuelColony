class Tournament < ApplicationRecord
  belongs_to :end_user
  has_many :participants, dependent: :destroy

  validates :title, { presence: true, length: { maximum: 100 } }
  validates :content, { presence: true, length: { maximum: 2000 } }
  validates :result, length: { maximum: 2000 }
  validates :max, { presence: true, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 99999999 } }
  validates :status, { presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 2 } }
end
