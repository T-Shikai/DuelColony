class Report < ApplicationRecord
  belongs_to :end_user
  validates :content, length: {maximun: 2000}
end
