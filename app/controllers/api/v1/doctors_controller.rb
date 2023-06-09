# frozen_string_literal: true

module Api
  module V1
    class DoctorsController < ApplicationController
      skip_before_action :authenticate_user!

      def index
        doctors = Doctor.includes(:category).all

        render json: DoctorBlueprint.render(doctors)
      end
    end
  end
end
