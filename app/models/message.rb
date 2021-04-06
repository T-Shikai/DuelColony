class Message < ApplicationRecord
  belongs_to :end_user
  belongs_to :room
  has_many :notices, dependent: :destroy
  validates :content, { presence: true, length: { maximum: 300 } }
  
  after_create_commit { MessageBroadcastJob.perform_later self }
end
