Rails.application.routes.draw do
  devise_for :users ,controllers: {   registrations: 'users/registrations',
    sessions: 'users/sessions' }
  resources :users ,only: [:index,:show,:edit,:update,:destroy,:new,:create]
  resources :skills do
    resource :user_skills, only: [:create]
  end
  get '/mypage' => 'users#mypage'
    
end
