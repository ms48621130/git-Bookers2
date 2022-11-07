Rails.application.routes.draw do
  root to: 'homes#top'
  get 'homes/about', as: 'about'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :books, only: [:index, :show, :edit, :create]

  resources :users, only: [:index, :show, :edit]

end
