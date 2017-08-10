Links::Application.routes.draw do
  resources :users, only: [:create, :new]
  resources :links
  resources :comments
  resource :session, only: [:create, :new, :destroy]
end
