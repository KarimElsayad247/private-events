class Attendance < ApplicationRecord

  self.table_name = 'attendance'

  belongs_to :attendee, class_name: "User"
  belongs_to :event
end
