class Post < ApplicationRecord
  belongs_to :end_user
  belongs_to :topic
  attachment :image

  validates :content, presence: true
end
