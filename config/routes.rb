Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "events#index"

  resources :events, only: [:index, :new, :create, :show] do
    post 'attend', on: :member, to: 'attendance#create'
    delete 'leave', on: :member, to: 'attendance#destroy'
  end
  resources :users, only: [:show]

end
