Rails.application.routes.draw do
  get 'welcome/greet'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # get '/static_pages/home', to: 'static_pages#home'

  root 'gossip_project#home'

  get '/contact', to: 'gossip_project#contact'
  
  get '/team', to: 'gossip_project#team'

  resources :gossips
  resources :welcome
  resources :city
  resources :users
  resources :comments
  resources :sessions

end
