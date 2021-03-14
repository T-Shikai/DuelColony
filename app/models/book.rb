class Book < ApplicationRecord
  belongs_to :end_user
  belongs_to :topic
  validates :end_user_id, uniqueness: { scope: :topic_id }
end
