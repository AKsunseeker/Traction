Rails.application.routes.draw do

  devise_for :users, controllers: { registrations: 'registrations'}
  

  resources :users do 
    resources :biometrics 
  end

  resources :workouts do
    resources :exercises
  end

  resources :groups
  resources :categories
  resources :memberships
  resources :locations

 
  root 'welcome#index'
  get 'about_us', to: 'welcome#about_us'
  
end