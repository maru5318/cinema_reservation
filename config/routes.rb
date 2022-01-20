Rails.application.routes.draw do
  root "top#index"
  resources :movies,only:[:index,:show]do
    get "search",on: :collection
    get "date_schedule",on: :collection
  end
  resources :theaters,only:[:index,:show]do
    resources :movies
  end
  resource :session,only: [:create,:destroy]
  resource :account
  resource :reservation, only: [:show,:update]do
    post "step1"
    post "step2"
    post "step3"
  end
  resource :admin do
    get "admin_login"
  end
  namespace :admin do
    resource :account,only: [:show,:new,:edit,:create,:destroy]
    resource :session,only: [:create,:destroy]
    resources :movies do
      get "search",on: :collection
    end
    resources :reservations do
      get "search",on: :collection
    end
    resources :schedules do
      get "search",on: :collection
    end
  end
end
