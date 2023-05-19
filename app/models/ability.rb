# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    can :manage, :all if user.admin?

    can :manage, Appointment, doctor_id: user.id if user.doctor?

    return unless user.patient?

    can :read, Doctor
    can :create, Appointment
    can :read, Appointment
  end
end
