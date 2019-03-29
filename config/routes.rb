Rails.application.routes.draw do
  namespace :ajax do
    resources :rates, only: :index
  end
  resources :rates, only: :index
  root "rates#index"
end
