Rails.application.routes.draw do
  root 'chatroom#index'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get 'about', to: 'pages#about'
  resources :subjects
  get 'signup', to: 'users#new'
  resources :users, except: [:new]
  post 'message', to: 'messages#create'
  get 'import', to: 'subjects#import'
  get 'import2', to: 'subjects#import2'
  get 'seturl', to: 'subjects#set_url'
  get 'deleteall', to: 'subjects#destroy2'
end
