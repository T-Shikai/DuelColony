class Like < ApplicationRecord
  belongs_to :end_user
  belongs_to :post
  validates :end_user_id, uniqueness: { scope: :post_id }
end
