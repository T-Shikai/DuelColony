class Report < ApplicationRecord
  belongs_to :end_user
  validates :content, {presence: true, length: {maximum: 2000}}
end
