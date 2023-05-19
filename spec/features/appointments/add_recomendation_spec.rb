# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Add Recomendation', type: :feature do
  let!(:doctor) { create(:doctor) }
  let!(:patient) { create(:patient) }
  let!(:appointment) { create(:appointment, doctor:, patient:) }

  let(:recomendation) { 'Drink more tea with lemon.' }

  scenario 'Doctor logs in, adds recomendation to an appointment' do
    visit new_user_session_path
    fill_in 'Phone', with: doctor.phone.to_s
    fill_in 'Password', with: doctor.password.to_s
    click_button 'Log in'

    click_link 'Appointments'
    click_link 'Write recomendation', href: "/appointments/#{appointment.id}/edit"

    fill_in 'Recomendations', with: recomendation
    click_button 'Update'

    expect(page).to have_text 'Appointment updated successfully.'
    expect(appointment.reload.slice(:closed, :recomendations)).to eq(
      'closed' => true, 'recomendations' => recomendation
    )
  end
end
