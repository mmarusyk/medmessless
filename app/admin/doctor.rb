# frozen_string_literal: true

ActiveAdmin.register Doctor do
  permit_params :first_name, :last_name, :email, :category_id, :phone, :password, :password_confirmation

  form do |f|
    f.inputs do
      f.input :first_name
      f.input :last_name
      f.input :email
      f.input :phone
      if f.object.new_record?
        f.input :password
        f.input :password_confirmation
      end
      f.input :category, as: :select, collection: Category.all
    end
    f.actions
  end
end
