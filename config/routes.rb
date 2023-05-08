Rails.application.routes.draw do
  get 'welcome/greet'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # get '/static_pages/home', to: 'static_pages#home'

  root 'gossip_project#home'

  get '/contact', to: 'gossip_project#contact'
  
  get '/team', to: 'gossip_project#team'

  get 'welcome/:first_name', to: 'welcome#first_name', as: 'welcome_first_name'

  get '/welcome', to: 'welcome#first_name', as: 'show_welcome_first_name'
  
  resources :gossips
  resources :users, only: [:show]

  get 'gossips', to: 'welcome_first_name#gossips'
  get 'gossips/:id', to: 'gossips#show', as: 'show_gossip'
  get 'users/:id', to: 'users#show', as: 'show_user'

end
