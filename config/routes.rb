Rails.application.routes.draw do
  root                 'users#home'
  get    'about'    => 'users#about'
  get    'signup'   => 'users#new'
  get    'login'    => 'sessions#new'
  post   'login'    => 'sessions#create'
  delete 'logout'   => 'sessions#destroy'
  resources :users
  resources :account_activations, only: [:edit]
end
