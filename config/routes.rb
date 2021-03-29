Rails.application.routes.draw do
  root to: 'homes#top'
  get 'about' => 'homes#about'

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :admins, controllers: {
    sessions: 'admins/sessions',
  }
  devise_for :end_users
  resources :end_users, only: [:show, :edit, :update]

  get 'topics/search' => 'topics#search', as: 'search_topic'
  resources :topics do
    resource :books, only: [:create, :destroy]
  end

  resources :posts do
    resource :likes, only: [:create, :destroy]
  end

  post 'rooms/cancel/:id' => 'rooms#cancel', as: 'cancel_room'
  post 'rooms/apply/:id' => 'rooms#apply', as: 'apply_room'
  post 'rooms/accept/:id' => 'rooms#accept', as: 'accept_room'
  get 'rooms/chat/:id' => 'rooms#chat', as: 'chat_room'
  post 'rooms/finish/:id' => 'rooms#finish', as: 'finish_room'
  resources :rooms

  resources :messages, only: [:create, :update]

  patch 'tournaments/update_info/:id' => 'tournaments#update_info', as: 'info_tournament'
  post 'tournaments/finish/:id' => 'tournaments#finish', as: 'finish_tournament'
  get 'tournaments/result/:id' => 'tournaments#result', as: 'result_tournament'
  resources :tournaments

  resources :participants, only: [:create, :destroy, :update]

  resources :reports, only: [:new, :create]
end
