Rails.application.routes.draw do
  devise_for :users ,controllers: {   registrations: 'users/registrations',
    sessions: 'users/sessions' }
  resources :users ,only: [:index,:show,:edit,:update,:destroy]
  resources :skills do
    resource :user_skills, only: [:create, :destroy]
  end
  get '/mypage' => 'users#mypage'
    
end
