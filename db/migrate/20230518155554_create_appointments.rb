# frozen_string_literal: true

class CreateAppointments < ActiveRecord::Migration[7.0]
  def change
    create_table :appointments do |t|
      t.text :recomendations
      t.boolean :closed, default: false
      t.references :patient
      t.references :doctor

      t.timestamps
    end
  end
end
