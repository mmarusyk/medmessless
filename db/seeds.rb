# frozen_string_literal: true

category = Category.new(name: 'ABC')

50.times do |n|
  Doctor.create(
    first_name: "Name #{n}",
    last_name: "Surname #{n}",
    phone: "38068620536#{n}",
    password: 'somepass',
    password_confirmation: 'somepass',
    category:
  )
end

10.times do |n|
  Patient.create(
    first_name: "Patient Name #{n}",
    last_name: "Patient Surname #{n}",
    phone: "38068620537#{n}",
    password: 'somepass',
    password_confirmation: 'somepass'
  )
end

Patient.last(2).each do |p|
  Appointment.create(patient: p, doctor: Doctor.first)
end

Patient.first(2).each do |p|
  Appointment.create(patient: p, doctor: Doctor.first, recomendations: 'Some text. alalal', closed: true)
end
if Rails.env.development?
  AdminUser.create!(email: 'admin@example.com', password: 'password',
                    password_confirmation: 'password')
end
