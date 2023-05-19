# frozen_string_literal: true

class Appointment < ApplicationRecord
  belongs_to :patient
  belongs_to :doctor

  validate :doctor_availability

  scope :active, -> { where(closed: false) }

  private

  def doctor_availability
    errors.add(:base, 'doctor is not available') if doctor && !doctor.available?
  end
end
