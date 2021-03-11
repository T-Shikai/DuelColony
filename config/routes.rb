Rails.application.routes.draw do
  devise_for :end_users
  resources :end_users, only:[:show, :edit, :update]
  resources :topics do
    resource :books, only:[:create, :destroy]
  end
  resources :posts do
    resource :likes, only:[:create, :destroy]
  end
  post 'rooms/cancel/:id' => 'rooms#cancel', as: 'cancel_room'
  post 'rooms/apply/:id' => 'rooms#apply', as: 'apply_room'
  post 'rooms/accept/:id' => 'rooms#accept', as: 'accept_room'
  get 'rooms/chat/:id' => 'rooms#chat', as: 'chat_room'
  post 'rooms/finish/:id' => 'rooms#finish', as: 'finish_room'
  resources :rooms
  resources :messages, only:[:create, :update]
  resources :reports, only:[:new, :create]
  root to: 'homes#top'
  get 'about' => 'homes#about'

end
