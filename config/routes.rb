# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      mount_devise_token_auth_for 'User', at: 'auth', controllers: {
        registrations: 'api/v1/auth/registrations',
        sessions: 'api/v1/auth/sessions'
      }

      resources :users, only: :update
      resources :books, only: %i[create update destroy index]
      resources :favorite_books, only: %i[index create destroy]
    end
  end
end
