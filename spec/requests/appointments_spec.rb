# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AppointmentsController, type: :request do
  let!(:patient) { create(:patient) }

  before { sign_in patient }

  describe 'POST #create' do
    context 'with valid attrs' do
      let!(:doctor) { create(:doctor) }

      it 'creates a new appointment' do
        expect do
          post appointments_path, params: { appointment: { doctor_id: doctor.id } }
        end.to change(Appointment, :count).by(1)

        expect(response).to redirect_to(appointments_path)
        expect(flash[:notice]).to eq('Appointment created successfully')
      end
    end

    context 'with invalid attrs' do
      let(:invalid_doctor_id) { -1 }

      it 'does not create an appointment' do
        expect do
          post appointments_path, params: { appointment: { doctor_id: invalid_doctor_id } }
        end.not_to change(Appointment, :count)

        expect(response).to redirect_to(doctors_path)
        expect(flash[:alert]).to eq('Failed to create appointment: Doctor must exist')
      end
    end
  end
end
