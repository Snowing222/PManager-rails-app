Rails.application.routes.draw do
  resources :statuses
  resources :products do
    resources :samples
  end
  resources :users, only: [:new, :create]
  resources :samples
  resources :companies

  get    '/login'   => 'sessions#new'
  post   '/sessions'   => 'sessions#create'
  delete '/logout'  => 'sessions#destroy'
  get '/'=> 'sessions#new'
  get '/home' => 'products#index'
  get '/auth/google_oauth2/callback' => 'sessions#create'
  
  get '/auth/failure' => '/'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

