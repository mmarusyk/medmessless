# frozen_string_literal: true

class DoctorsController < ApplicationController
  def index
    authorize! :index, Doctor

    @categories = Category.all
    @pagy, @doctors = pagy DoctorQuery.new(params).collection
  end
end
