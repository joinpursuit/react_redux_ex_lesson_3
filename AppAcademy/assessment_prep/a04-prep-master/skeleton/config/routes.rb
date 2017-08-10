Links::Application.routes.draw do
  resources :users, only: [:create, :new]
  resources :comments
  resources :links
  resource :session, only: [:create, :destroy, :new]

end
