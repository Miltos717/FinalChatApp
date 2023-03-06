Rails.application.routes.draw do

  resources :chatrooms, only: [:index, :show, :new, :create]
  get "room", to: "chatroom#new"
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

  get 'e', to: "pages#ex"
  get 'profile/:id',to: "profile#show", as: 'profile'

  post 'users/:id/follow',to: "users#follow", as: 'follow'
  post 'users/:id/unfollow',to: "users#unfollow", as: 'unfollow'
  post 'users/:id/decline', to: 'users#decline', as: 'decline'
  post 'users/:id/accept',to: "users#accept", as: 'accept'
  post 'users/:id/cancel',to: "users#cancel", as: 'cancel'


  mount ActionCable.server, at: '/cable'

end
