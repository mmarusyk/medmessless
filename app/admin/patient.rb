# frozen_string_literal: true

ActiveAdmin.register Patient do
    controller do
      def update
        flash[:alert] = "You are not allowed to perform this action."
        redirect_to admin_patients_path
      end

      def create
        flash[:alert] = "You are not allowed to perform this action."
        redirect_to admin_patients_path
      end

      def destroy 
        flash[:alert] = "You are not allowed to perform this action."
        redirect_to admin_patients_path
      end
    end
end
