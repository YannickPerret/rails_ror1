Rails.application.routes.draw do
  get 'dashboard/index'
  resources :students do
    resources :grades, only: [:index]
    get 'report', on: :member

    member do
      get 'assign_class'
      patch 'update_class'
      get 'assign_semester'
    end
  end

  resources :teachers
  resources :supervisors
  resources :school_classes
  resources :subjects
  resources :grades
  resources :semesters
  resources :users

  resources :class_students, only: [:create, :destroy, :index, :new, :edit, :update]
  resources :teacher_subjects, only: [:create, :destroy, :index, :new, :edit, :update]

  resources :class_subject_semesters, only: [:index, :new, :create]


  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create', as: 'sessions_create'
  delete 'logout', to: 'sessions#destroy'

  get '/dashboard' => 'dashboard#index'

  root 'dashboard#index'
end
