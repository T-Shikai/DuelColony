class Room < ApplicationRecord
  has_many :messages, dependent: :destroy
  has_many :notices, dependent: :destroy
  belongs_to :host, class_name: "EndUser"
  belongs_to :guest, class_name: "EndUser"

  validates :title, {presence: true, length: {maximum: 80}}
  validates :content, {presence: true, length: {maximum: 1000}}
  validates :status, presence: true
end
