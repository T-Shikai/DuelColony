class Message < ApplicationRecord
  belongs_to :end_user
  belongs_to :room
  has_many :notices
  validates :content, length: {maximun: 300}
end
