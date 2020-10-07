Rails.application.routes.draw do
  devise_for :users
  resources :users ,only: [:index,:show,:edit,:update,:destroy]
  resources :skills do
    resource :user_skills, only: [:create, :destroy]
  end
  get '/mypage' => 'users#mypage'

  root :to => 'registration#new'

  devise_scope :user do
    get "user/:id", :to => "users/registrations#detail"
    get "signup", :to => "users/registrations#new"
    post "signup", :to => "users/registrations#create"
    get "login", :to => "users/sessions#new"
    post "login", :to => "users/sessions#create"
    delete "logout", :to => "users/sessions#destroy"
  end
    
end
