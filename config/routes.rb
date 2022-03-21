Rails.application.routes.draw do
  resources :reservations
  get 'reservations/index'
  resources :rooms
  get 'rooms/index'
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'
  }

  devise_scope :user do
    get "user/:id", :to => "users/registrations#detail"
    get "signup", :to => "users/registrations#new"
    get "login", :to => "users/sessions#new"
    get "logout", :to => "users/sessions#destroy"
    get 'users/:id/edit', :to => 'users/registrations#edit'
    get 'users/show', :to => 'users/registrations#show'
  end
  root 'top#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
