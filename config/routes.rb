Rails.application.routes.draw do
  get 'errors/not_found'
  get 'errors/internal_server_error'
  devise_for :users
  root to: 'pages#home'

  resources :tasks do
    member do
      patch :change
    end
  end

  get 'about' => 'pages#about'
  get 'test'  => 'pages#test'
  get '/404' => 'errors#not_found', :via => :all
  get '/500' => 'errors#internal_server_error', :via => :all
end
