Rails.application.routes.draw do
  root "top#index"
  resources :movies,only:[:index,:show]do
    
  end
  resources :theaters,only:[:index,:show]do
    resources :movies
  end
  resource :session,only: [:create,:destroy]
  resource :account,only: [:show,:edit,:destroy]
  resource :reservation, only: [:show]do
    post "step1"
  end
end
