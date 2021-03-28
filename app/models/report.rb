class Report < ApplicationRecord
  belongs_to :end_user
  validates :content, length: {maximum: 2000}
end
