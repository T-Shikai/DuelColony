class Participant < ApplicationRecord
  belongs_to :end_user
  belongs_to :tournamen
end
