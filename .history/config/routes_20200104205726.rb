Rails.application.routes.draw do
  resources :tickets
  resources :events, :only => [:index, :new, :create, :show]

end
