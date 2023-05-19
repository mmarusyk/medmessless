# frozen_string_literal: true
Admin.create(
  first_name: "Misha",
  last_name: "Mar",
  phone: '380686205333',
  password: 'somepass',
  password_confirmation: 'somepass'
)

patient = Patient.create(
  first_name: "Ivan",
  last_name: "Ivanov",
  phone: '380686205334',
  password: 'somepass',
  password_confirmation: 'somepass'
)

categories_attr = [
  { name: 'Pediatrician'},
  { name: 'Dermatologist'},
  { name: 'Neurologist'},
  { name: 'Pulmonologist'},
  { name: 'Ophthalmologist'}
]

Category.insert_all categories_attr

doctor1 = Doctor.create(
  first_name: "Semen",
  last_name: "Semenchenko",
  phone: '380686205335',
  password: 'somepass',
  password_confirmation: 'somepass',
  category: Category.last
)

doctor2 = Doctor.create(
  first_name: "Vasyl",
  last_name: "Vasylyuk",
  phone: '380686205336',
  password: 'somepass',
  password_confirmation: 'somepass',
  category: Category.first
)

Appointment.create(doctor: doctor1, patient: patient)
Appointment.create(doctor: doctor2, patient: patient, recomendations: 'Some recomendation', closed: true)
