class Room < ApplicationRecord
  has_many :user_rooms
  has_many :messages
  has_many :s
  belongs_to :host, class_name: "EndUser"
  belongs_to :guest, class_name: "EndUser"

  validates :title, presence: true
  validates :content, presence: true
end
