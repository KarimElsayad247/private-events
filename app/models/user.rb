class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :organized_events, foreign_key: "organizer_id", class_name: "Event"
  has_many :attendance, foreign_key: :attendee_id
  has_many :attended_events, through: :attendance, source: :event

  validates :username, presence: true, uniqueness: true,
            length: { in: 3..20 }

  def upcoming_attended_events
    attended_events.upcoming
  end

  def past_attended_events
    attended_events.past
  end
end
