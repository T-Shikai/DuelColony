class EndUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :topics, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :host, class_name: "Room", foreign_key: "host_id", dependent: :destroy
  has_many :guest, class_name: "Room", foreign_key: "guest_id", dependent: :destroy
  has_many :reports
  has_many :likes, dependent: :destroy
  has_many :books, dependent: :destroy
  has_many :tournaments, dependent: :destroy
  has_many :participants, dependent: :destroy
  has_many :active_notifications, class_name: 'Notice', foreign_key: 'visitor_id', dependent: :destroy
  has_many :passive_notifications, class_name: 'Notice', foreign_key: 'visited_id', dependent: :destroy

  validates :email, presence: true
  validates :name, {presence: true, length: {maximum: 30}}
  validates :introduction, length: {maximum: 2000}
  validates :status, presence: true
  attachment :image

end
