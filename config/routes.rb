Rails.application.routes.draw do

  devise_for :users, controllers: { registrations: 'registrations', omniauth_callbacks: 'users/omniauth_callbacks'}

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
  post 'add_workout', to: 'workouts#add_workout'
  post 'do_workout', to: 'workouts#do_workout'
  put 'finish', to: "workouts#finish"
  get 'get_workouts', to: "workouts#get_workouts"

  
end
