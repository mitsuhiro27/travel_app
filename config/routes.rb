Rails.application.routes.draw do
  get 'reservations/new'
  get 'reservations/index'
  get 'reservations/show'
  post 'reservations/confirm'
  get 'users/:id/account', to:'users#account', as: 'user_account'
  get 'users/:id/profile', to:'users#profile', as: 'user_profile'
  devise_for :users,:controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'   
  } 
  

  devise_scope :user do
    get "user/:id", :to => "users/registrations#edit"
    get "signup", :to => "users/registrations#new"
    get "login", :to => "users/sessions#new"
    get "logout", :to => "users/sessions#destroy"
  end

  resources :users, only:[:index, :update]

  get "/" => "home#top"
  
  resources :rooms do
    collection do
      get 'search'
    end
  end    

  resources :reservations, only:[:create]

  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
