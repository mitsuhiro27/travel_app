Rails.application.routes.draw do
  get 'users/show'
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

  resources :users, only:[:index, :show, :edit, :update]

  get "/" => "home#top"
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
