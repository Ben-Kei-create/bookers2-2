Rails.application.routes.draw do
devise_for :users
root to:"homes#top"
get 'show/edit'
get'home/about' => 'homes#top', as: 'about'
resources :books, only: [:create, :index, :show, :destroy, :edit]
get 'books/:id/edit' => 'books#edit'
resources :users, only: [:index, :show, :edit, :update]
patch 'books/:id' => 'books#update', as: 'update_book'

end