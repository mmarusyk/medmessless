# frozen_string_literal: true

class Doctor < User
  MAX_MANAGE_APPOINTMENTS = 10

  belongs_to :category
  has_many :appointments, dependent: :nullify
  has_many :patients, through: :appointments

  def available?
    appointments.active.count < MAX_MANAGE_APPOINTMENTS
  end
end
