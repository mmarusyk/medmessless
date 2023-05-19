# frozen_string_literal: true

class DoctorsController < ApplicationController
  def index
    authorize! :index, Doctor

    @categories = Category.all
    @pagy, @doctors = pagy(Doctor.where(category_id: params[:category_id].presence || @categories)) # Write query class
  end
end
