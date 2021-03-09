Rails.application.routes.draw do
  resources :end_users, only:[:show, :edit, :update]
  resources :topics
  resources :posts
  post 'rooms/cancel/:id' => 'rooms#cancel', as: 'cancel_room'
  resources :rooms
  devise_for :end_users
  root to: 'homes#top'
  get 'about' => 'homes#about'

end
