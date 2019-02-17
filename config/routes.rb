Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :tasks do
    member do
      patch :change
    end
  end

  get 'about' => 'pages#about'
  get 'test'  => 'pages#test'
end
