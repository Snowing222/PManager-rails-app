Rails.application.routes.draw do
  resources :statuses, only: [:create]
  resources :products do
    resources :samples,only: [:new]
  end
  resources :users, only: [:new, :create, :edit, :show, :update, :index]
  resources :samples,only:[:create, :show]
  resources :companies,only: [:show]

  get    '/login'   => 'sessions#new'
  post   '/login'   => 'sessions#create'
  delete '/logout'  => 'sessions#destroy'
  get '/'=> 'sessions#new'
  get '/home' => 'products#index'
  get 'https://pmanagering.herokuapp.com/auth/google_oauth2/callback' => 'sessions#create'
  get '/auth/google_oauth2/callback' => 'sessions#create'
 
  
  get '/auth/failure' => '/'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

