class EndUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :topics
  has_many :posts
  has_many :user_rooms
  has_many :messages
  has_many :host, class_name: "Room", foreign_key: "host_id", dependent: :destroy
  has_many :guest, class_name: "Room", foreign_key: "guest_id", dependent: :destroy
  has_many :reports
  has_many :likes
  has_many :books
  has_many :tournaments
  has_many :participants
  has_many :active_notifications, class_name: 'Notice', foreign_key: 'visitor_id', dependent: :destroy
  has_many :passive_notifications, class_name: 'Notice', foreign_key: 'visited_id', dependent: :destroy

  validates :name, {presence: true, length: {maximum: 30}}
  validates :introduction, length: {maximum: 2000}
  attachment :image

end
