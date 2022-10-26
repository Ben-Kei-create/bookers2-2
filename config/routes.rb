Rails.application.routes.draw do
get 'show/edit'
devise_for :users
root to:"homes#top"
get'homes/about' => 'homes#about', as: 'about'
post'books' => 'books#create'
resources :books, only: [:create, :index, :show, :edit]
resources :users, only: [:show, :edit, :update]
end