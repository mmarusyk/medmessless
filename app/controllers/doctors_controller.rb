class DoctorsController < ApplicationController
  def index
    @categories = Category.all
    @pagy, @doctors = pagy(Doctor.where(category_id: params[:category_id].presence || @categories)) # Write qquery class
  end
end
