class Participant < ApplicationRecord
  belongs_to :end_user
  belongs_to :tournament
  validates :status, presence: true
end
