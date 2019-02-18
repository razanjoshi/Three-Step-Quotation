Rails.application.routes.draw do
  resources :subscriptions
  root to: redirect('/quotes')
  resources :quotes
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
