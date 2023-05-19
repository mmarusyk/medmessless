# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'registrations'
  }

  root 'profile#show'

  resources :doctors, only: :index

  resources :appointments, only: %i(index create edit update)
end
