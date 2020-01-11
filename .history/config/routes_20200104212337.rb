Rails.application.routes.draw do
  get 'home/index'
  root to:  'home#index'

  devise_for :users
  resources :tickets
  resources :events, :only => [:index, :new, :create, :show]

end
