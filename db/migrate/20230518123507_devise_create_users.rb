# frozen_string_literal: true

class DeviseCreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email, default: ""
      t.string :type, null: false
      t.string :phone, null: false, default: ""
      t.references :category
      t.string :encrypted_password, null: false, default: ""
      t.datetime :remember_created_at

      t.timestamps null: false
    end

    add_index :users, :phone, unique: true
    add_index :users, :type
  end
end
