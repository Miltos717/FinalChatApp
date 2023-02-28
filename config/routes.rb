Rails.application.routes.draw do
  get 'pages/home'
  get 'messages/create'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root "pages#home"
  get "login", to: "sessions#new"
  post 'login', to: "sessions#create"
  get 'logout', to: "sessions#destroy"
  post 'message', to: "messages#create"
  get 'signup', to: "users#new"
  get 'all_users', to: "users#all_users"
  get "home", to: "pages#home"
  get 'messages', to: "chatroom#index"
  resources :users, only: [:new, :create]

  mount ActionCable.server, at: '/cable'

end
