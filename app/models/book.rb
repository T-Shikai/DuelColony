class Book < ApplicationRecord
  belongs_to :end_user
  belongs_to :topic
end
