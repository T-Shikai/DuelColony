Rails.application.routes.draw do
  devise_for :end_users
  resources :end_users, only:[:show, :edit, :update]
  resources :topics
  resources :posts
  post 'rooms/cancel/:id' => 'rooms#cancel', as: 'cancel_room'
  post 'rooms/apply/:id' => 'rooms#apply', as: 'apply_room'
  post 'rooms/accept/:id' => 'rooms#accept', as: 'accept_room'
  get 'rooms/chat/:id' => 'rooms#chat', as: 'chat_room'
  resources :rooms
  root to: 'homes#top'
  get 'about' => 'homes#about'

end
