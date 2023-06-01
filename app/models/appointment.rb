# frozen_string_literal: true

class Appointment < ApplicationRecord
  belongs_to :patient
  belongs_to :doctor

  validate :doctor_availability
  validate :unique_per_patient

  scope :active, -> { where(closed: false) }
  scope :for_patient_and_doctor, ->(patient, doctor) { where(patient:, doctor:) }

  private

  def doctor_availability
    errors.add(:base, 'doctor is not available') if doctor && !doctor.available?
  end

  def unique_per_patient
    return if self.class.active.for_patient_and_doctor(patient, doctor).blank?

    errors.add(:base, 'Appointment was already created with the doctor')
  end
end
