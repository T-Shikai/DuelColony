class EndUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true
  attachment :image

  has_many :topics
  has_many :posts
  has_many :user_rooms
  has_many :messages
  has_many :host, class_name: "Room", foreign_key: "host_id", dependent: :destroy
  has_many :guest, class_name: "Room", foreign_key: "guest_id", dependent: :destroy
  has_many :report
end
