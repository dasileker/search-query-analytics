Rails.application.routes.draw do
  get 'landing/index'
  devise_for :users
  root 'searches#new'
  resources :searches, only: [:create]
  resources :search_histories, only: [:index] do
    collection do
      get :trends
    end
  end
end
