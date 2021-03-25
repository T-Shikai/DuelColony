class Notice < ApplicationRecord
  belongs_to :room
  belongs_to :message
  belongs_to :visitor, class_name: 'EndUser', foreign_key: 'visitor_id'
  belongs_to :visited, class_name: 'EndUser', foreign_key: 'visited_id'
end
