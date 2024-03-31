class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update_class, :destroy, :assign_class, :assign_semester]

  def report
    @student = Student.find(params[:id])
  end

  def assign_class
    @student = Student.find(params[:id])
    @school_classes = SchoolClass.all
    @semesters = Semester.all
    @class_student = ClassStudent.find_or_initialize_by(student_id: @student.id) # Initialisation de @class_student
  end

  def assign_semester
    @student = Student.find(params[:id])
    @semesters = Semester.all
    # Ajoutez d'autres logiques nécessaires pour la vue
  end

  def index
    @students = Student.all
  end

  def show
    @student = Student.find(params[:id])
  end

  def new
    @student = Student.new

  end

  def edit
    @school_classes = SchoolClass.all
    @semesters = Semester.all
    @subjects = Subject.all
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      redirect_to @student, notice: 'Student was successfully created.'
    else
      render :new
    end
  end

  def update
    if @student.update(student_params)
      redirect_to @student, notice: 'Student was successfully updated.'
    else
      render :edit
    end
  end

  def update_class
    @student = Student.find(params[:id])
    @class_student = ClassStudent.find_or_initialize_by(student_id: @student.id)

    if @class_student.update(school_class_id: params[:student][:school_class_id], semester_id: params[:student][:semester_id])
      redirect_to @student, notice: 'School class and semester were successfully assigned.'
    else
      @school_classes = SchoolClass.all
      @semesters = Semester.all
      render :assign_class, status: :unprocessable_entity
    end
  end


  def destroy
    @student.destroy
    redirect_to students_url, notice: 'Student was successfully destroyed.'
  end

  private
  def set_student
    @student = Student.find(params[:id])
  end

  def student_params
    params.require(:student).permit(:firstname, :lastname, :email, :phone, :address, :city, :country, :password)
  end

end
