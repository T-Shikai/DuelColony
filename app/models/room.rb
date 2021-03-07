class Room < ApplicationRecord
  has_many :user_rooms
  has_many :messages

  validates :title, presence: true
  validates :content, presence: true
end
