Rails.application.routes.draw do
  devise_for :users
  resources :tickets
  resources :events, :only => [:index, :new, :create, :show]
  get 'public/index'
end
