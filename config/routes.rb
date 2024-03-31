Rails.application.routes.draw do
  get 'dashboard/index'
  resources :students do
    resources :grades, only: [:index]
    get 'report', on: :member
  end

  resources :teachers
  resources :supervisors
  resources :school_classes
  resources :subjects
  resources :grades
  resources :semesters

  resources :class_students, only: [:create, :destroy, :index]
  resources :teacher_subjects, only: [:create, :destroy, :index]
  resources :class_subject_semesters, only: [:create, :destroy, :index]

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create', as: 'sessions_create'
  delete 'logout', to: 'sessions#destroy'

  root 'dashboard#index'
end
