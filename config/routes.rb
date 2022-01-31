require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'
  devise_for :users

  resources :proponents do
    collection do
      get :calculate_inss_discount
    end
  end

  resources :reports, only: :index do
    collection do
      get :proponent_by_salary
    end
  end
  
end
