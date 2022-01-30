Rails.application.routes.draw do
  resources :proponents
  devise_for :users
end
