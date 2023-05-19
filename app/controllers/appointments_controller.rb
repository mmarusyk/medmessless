class AppointmentsController < ApplicationController
  before_action :resource, only: %i(edit update)

  def index
    @pagy, @appointments = pagy(current_user.appointments.includes(:patient).order(closed: :asc)) # Write qquery class
  end

  def new
    @appointment = Appointment.new
  end

  def create

  end

  def edit
  end
   
  def update
    if resource.update(update_params)
      redirect_to appointments_path
    else
      render :edit
    end
  end

  private

  def resource
    @appointment ||= current_user.appointments.find(params[:id])
  end

  def update_params
    params.require(:appointment).permit(:recomendations).merge(closed: true)
  end
end
