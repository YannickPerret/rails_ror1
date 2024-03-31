Rails.application.routes.draw do
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

  root 'welcome#index'
end
