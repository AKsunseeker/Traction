Rails.application.routes.draw do

  devise_for :users, controllers: { registrations: 'registrations', omniauth_callbacks: 'users/omniauth_callbacks'}

  resources :users do 
    resources :biometrics 
  end

  resources :workouts do
    resources :exercises, except: [:show]
  end

  resources :groups
  resources :categories
  resources :memberships
  resources :locations

  get 'faq', to: 'welcome#faq', as: 'faq'
  get 'workout_history/:id', to: 'workouts#workout_history', as: 'workout_history'
  root 'welcome#index'
  get 'about_us', to: 'welcome#about_us'
  post 'add_workout', to: 'workouts#add_workout'
  post 'do_workout', to: 'workouts#do_workout'
  post 'remove_workout/:id', to: 'workouts#remove_workout', as: 'remove_workout'
  post 'delete_workout/:id', to: 'workouts#delete_workout', as: 'delete_workout'
  put 'finish', to: "workouts#finish"
  get 'get_exercise_progress', to: "workouts#get_exercise_progress"
  get 'get_biometrics_progress', to: "biometrics#get_biometrics_progress"
  get 'get_categories_progress', to: "categories#get_categories_progress"

  
end
