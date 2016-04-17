Rails.application.routes.draw do
  get 'properties/new'

  root                    'pages#home'
  get    'about'       => 'pages#about'
  get    'signup'      => 'users#new'
  get    'login'       => 'sessions#new'
  post   'login'       => 'sessions#create'
  delete 'logout'      => 'sessions#destroy'
  get    'addproperty' => 'properties#new'
  resources :users
  resources :account_activations, only: [:edit]
  resources :properties
  resources :comments,            only: [:create, :destroy]
end
