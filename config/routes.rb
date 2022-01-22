Rails.application.routes.draw do
  root "top#index"
  get "bad_request" => "top#bad_request"
  get "forbidden" => "top#forbidden"
  get "internal_server_error" => "top#internal_server_error"
  resources :movies,only:[:index,:show]do
    get "search",on: :collection
    get "date_schedule",on: :collection
  end
  resources :theaters,only:[:index,:show]do
    resources :movies
  end
  resource :session,only: [:create,:destroy]
  resource :account
  resource :reservation, only: [:update]do
    post "/" => "reservations#show"
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
      get "sort",on: :collection
      get "destroys",on: :collection
    end
    resources :schedules do
      get "search",on: :collection
    end
  end
end
