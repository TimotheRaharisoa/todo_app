Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :tasks
      resources :users
    end
  end

  resources :tasks do
    member do
      patch :toggle_completion
    end
  end
  
  root 'tasks#index'
end