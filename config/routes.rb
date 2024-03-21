Rails.application.routes.draw do
  resources :branches do
    resources :branch_histories, only: [:index, :show]
    resources :note_evaluate_branches, only: [:index, :show]
  end
  
  resources :school_classes do
    resources :student_contain_school_classes, only: [:index, :show]
    resources :teacher_conduct_school_classes, only: [:index, :show]
    resources :school_class_study_branches, only: [:index, :show]

    member do
      get 'show_notes'
      get 'edit_branches'
      patch 'update_branches'
    end

    resources :students, only: [] do
      resources :branches, only: [] do
        resource :note, only: [:new, :create, :edit, :update]
      end
    end
  end
    
  resources :users do
    resources :notes, only: [:index, :show]
    resources :people_teach_branches, only: [:index, :show]
  end
  
  resources :notes do
    resources :note_evaluate_branches, only: [:index, :show]
  end

  resources :students do
    resources :school_classes, only: [] do
      delete :remove_from_student, on: :member
    end
    resources :notes, only: [:index, :show, :new, :create]
    get 'branches', to: 'students#branches', as: 'branches'
  end

  delete 'student_contain_school_classes/:id', to: 'students#remove_school_class', as: 'remove_student_school_class'

  resources :teachers do
    resources :notes, only: [:index, :show, :new, :create]
    get 'branches', to: 'teachers#branches', as: 'branches'
  end

  resources :supervisors do 
    resources :notes, only: [:index, :show, :new, :create]
    get 'branches', to: 'supervisors#branches', as: 'branches'
  end

  get '/dashboard' => 'dashboard#index'

  # UNAUTHENTICATED ROUTES
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
  get "login", to: "sessions#new"

  root "home#index"

  get "up" => "rails/health#show", as: :rails_health_check
end
