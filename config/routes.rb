Rails.application.routes.draw do
  resources :statuses
  resources :products do
    resources :samples
  end
  resources :users
  resources :samples
  resources :companies

  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  get '/'=> 'sessions#new'
  get '/home' => 'products#index'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

