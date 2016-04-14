Rails.application.routes.draw do
  get 'properties/new'

  root                    'users#home'
  get    'about'       => 'users#about'
  get    'signup'      => 'users#new'
  get    'login'       => 'sessions#new'
  post   'login'       => 'sessions#create'
  delete 'logout'      => 'sessions#destroy'
  get    'addproperty' => 'properties#new'
  resources :users
  resources :account_activations, only: [:edit]
  resources :properties
end
