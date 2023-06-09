# frozen_string_literal: true

class DoctorBlueprint < Blueprinter::Base
  identifier :id

  fields :first_name, :last_name, :email

  field :category do |doctor|
    doctor.category.name
  end
end
