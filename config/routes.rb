Rails.application.routes.draw do
  root 'chatroom#index'
  get 'login', to: 'sessions#new'
  get 'about', to: 'pages#about'

end
