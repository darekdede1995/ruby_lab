Rails.application.routes.draw do
  # get 'events/index'
  # get 'events/new'
  # post 'events/new' => 'events#create'
  # get 'events/create'
  # get 'events/:id' => 'events#show'

  resources :tickets
  resources :events, :only => [:index, :new, :create, :show]
  # root :to => "tickets#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
