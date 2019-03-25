class Appointment < ApplicationRecord
  # Validation for the date field, ensure our current scoped user does not have a conflicting appointment
  validates :date, uniqueness: { scope: :user }

  belongs_to :user
  belongs_to :patient
end
