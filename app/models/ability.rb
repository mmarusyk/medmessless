class Ability
  include CanCan::Ability

  def initialize(user)
    if user.admin?
      can :manage, :all
    end

    if user.doctor?
      can :manage, Appointment, doctor_id: user.id
    end

    if user.patient?
      can :read, Doctor
      can :create, Appointment
      can :read, Appointment
    end
  end
end
