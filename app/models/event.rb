class Event < ApplicationRecord
  belongs_to :organizer, class_name: "User"
  has_many :attendance
  has_many :attendees, through: :attendance

  validates :title, :date, :location, :organizer_id, presence: true
  validate :date_can_not_be_in_the_past

  def date_can_not_be_in_the_past
    if date.present? && date < Date.today
      errors.add(:date, "can't be in the past")
    end
  end

end

