require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'

  resources :proponents do
    collection do
      get :calculate_inss_discount
    end
  end
  devise_for :users
end
