# frozen_string_literal: true

class AppointmentsController < ApplicationController
  before_action :set_appointment, only: %i[edit update]

  def index
    authorize! :index, Appointment

    @pagy, @appointments = pagy(current_user.appointments.includes(:patient, :doctor).order(closed: :asc))
  end

  def edit; end

  def create
    authorize! :create, Appointment

    appointment = current_user.appointments.new(create_params)

    if appointment.save
      redirect_to appointments_path, notice: 'Appointment created successfully'
    else
      redirect_to doctors_path,
                  alert: "Failed to create appointment: #{appointment.errors.full_messages.join(' and ')}"
    end
  end

  def update
    authorize! :update, Appointment

    if @appointment.update(update_params)
      redirect_to appointments_path, notice: 'Appointment updated successfully.'
    else
      render :edit
    end
  end

  private

  def set_appointment
    @appointment = current_user.appointments.find(params[:id])
  end

  def create_params
    params.require(:appointment).permit(:doctor_id)
  end

  def update_params
    params.require(:appointment).permit(:recomendations).merge(closed: true)
  end
end
