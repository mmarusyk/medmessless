# frozen_string_literal: true

Rails.application.routes.draw do
  mount Rswag::Api::Engine => '/api-docs'
  mount Rswag::Ui::Engine => '/api-docs'

  devise_for :users, controllers: {
    registrations: 'registrations'
  }
  ActiveAdmin.routes(self)

  root 'profile#show'

  resources :doctors, only: :index

  resources :appointments, only: %i[index create edit update]

  namespace :api do
    namespace :v1 do
      resources :doctors, only: :index
    end
  end
end
