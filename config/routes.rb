Rails.application.routes.draw do
  resource :end_users, only:[:show, :edit, :update]
  resources :topics
  resources :posts
  devise_for :end_users
  root to: 'homes#top'
  get 'about' => 'homes#about'

end
