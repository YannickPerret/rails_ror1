Rails.application.routes.draw do
  resources :branches do
    resources :branch_histories, only: [:index, :show]
    resources :note_evaluate_branches, only: [:index, :show]
  end
  
  # Routes pour SchoolClass, incluant les sous-ressources pour StudentContainSchoolClass et TeacherConductSchoolClass
  resources :school_classes do
    resources :student_contain_school_classes, only: [:index, :show]
    resources :teacher_conduct_school_classes, only: [:index, :show]
    resources :school_class_study_branches, only: [:index, :show]
    member do
      get 'show_notes'
      get 'edit_branches'
      put 'update_branches'
    end

  end
  
  # Routes pour Role
  
  # Routes pour People, incluant les sous-ressources pour Notes et PeopleTeachBranch
  resources :users do
    resources :notes, only: [:index, :show]
    resources :people_teach_branches, only: [:index, :show]
  end
  
  # Routes pour Note, incluant les sous-ressources pour NoteEvaluateBranch
  resources :notes do
    resources :note_evaluate_branches, only: [:index, :show]
  end
  get 'contacts/new'
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


  root "home#index"


  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
