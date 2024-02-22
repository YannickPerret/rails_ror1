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
  end
  
  # Routes pour Role
  resources :roles
  
  # Routes pour People, incluant les sous-ressources pour Notes et PeopleTeachBranch
  resources :people do
    resources :notes, only: [:index, :show]
    resources :people_teach_branches, only: [:index, :show]
  end
  
  # Routes pour Note, incluant les sous-ressources pour NoteEvaluateBranch
  resources :notes do
    resources :note_evaluate_branches, only: [:index, :show]
  end
  get 'contacts/new'
  resources :students do
    resources :notes, only: [:index, :show, :new, :create]
    get 'branches', to: 'students#branches', as: 'branches'
  end


  root "home#index"


  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
