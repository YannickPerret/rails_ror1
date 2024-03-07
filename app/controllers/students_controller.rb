class StudentsController < ApplicationController
    before_action :set_student, only: %i[ show edit update destroy ]
    before_action :set_school_classes, only: %i[new edit]


    def index
        @students = Student.all
    end

    def show
        @student = Student.find(params[:id])
        
    end

    def new
        @student = Student.new
    end

    def create
        @student = Student.new(student_params)
        
        if @student.save
            redirect_to @student
        else
            render :new
        end
    end

    def edit
        @student = Student.find(params[:id])
    end

    def update
        @student = Student.find(params[:id])
        if @student.update(student_params)
          if params[:student][:new_school_class_id].present? && params[:student][:new_school_year].present?
            @student.student_contain_school_classes.create(
              school_class_id: params[:student][:new_school_class_id], 
              school_year: params[:student][:new_school_year]
            )
          end
          redirect_to @student, notice: 'Student was successfully updated.'
        else
          render :edit
        end
      end
      

    def destroy
        @student = Student.find(params[:id])
        @student.destroy
        redirect_to students_path
    end

    
    def remove_school_class
        association = StudentContainSchoolClass.find(params[:id])
        student = association.student
        association.destroy
        redirect_to edit_student_path(student), notice: "Classe supprimée avec succès."
      end

    private
    def set_student
        @student = Student.find(params[:id])
    end

    def set_school_classes
        @school_classes = SchoolClass.all
    end

    def student_params
        params.require(:student).permit(:firstname, :lastname, :address, :npa, :city, :email, :phoneNumber, :status, :acronym, :password_digest, :type, { school_class_ids: [] }, student_contain_school_classes_attributes: [:school_class_id, :school_year])
    end

end
