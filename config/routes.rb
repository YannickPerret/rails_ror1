Rails.application.routes.draw do
  get 'contacts/new'
  get 'home/index'
  resources :student_study_branches
  resources :teacher_teach_branches
  resources :teacher_conduct_school_classes
  resources :note_evaluate_branches
  resources :notes
  resources :students do
    resources :notes, only: [:index, :show, :new, :create]
    get 'branches', to: 'students#branches', as: 'branches'
  end
  resources :school_classes
  resources :teachers
  resources :branches


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root "home#index"

  get 'contact', to: 'contacts#new', as: 'new_contact'
  post 'contact', to: 'contacts#create', as: 'create_contact'
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
