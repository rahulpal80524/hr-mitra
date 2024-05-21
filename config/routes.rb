Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  root 'home#index'

  #public pages routes
  get 'about' => 'pages#about_us'
  get 'contact' => 'pages#contact_us'
  get 'privacy-policy' => 'pages#privacy_policy'
  get 'terms-conditions' => 'pages#terms_conditions'


  resources :employees
  resources :documents

  #example

  # get 'pages/contact_us'
  # get 'pages/privacy_policy'
  # get 'pages/terms_conditions'

  #get 'home/index'   #url /home/index
  #get '/home' => 'home#index' #url /home





end
