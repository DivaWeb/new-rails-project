Rails.application.routes.draw do
  resources :wikis
  resources :downgrade
  resources :charges, only: [:new, :create]
  devise_for :users
  get 'welcome/index'
  root  'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
