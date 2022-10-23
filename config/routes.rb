Rails.application.routes.draw do
get 'show/edit'
devise_for :users
root to:"homes#top"
get'homes/about' => 'homes#about', as: 'about'
resources :books, only: [:new, :create, :index, :show, :edit]
post'books' => 'books#create'
resources :users, only: [:show, :edit, :update]
end