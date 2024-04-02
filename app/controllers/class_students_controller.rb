# ==============================================================================
# Filename   : class_students_controller.rb
# Author     : tchoune
# Created    : 2024-04-01
# Last updated : 2024-04-01
# ==============================================================================

class ClassStudentsController < ApplicationController
  before_action :set_class_student, only: %i[ show edit update destroy ]

  # Display a list of all class students.
  def index
    @class_students = ClassStudent.all
  end

  # Display the details of a specific class student.
  def show
  end

  # Initialize a new class student object.
  def new
    @class_student = ClassStudent.new
  end

  # Edit the details of a class student.
  def edit
  end

  # Create a new class student record.
  def create
    @class_student = ClassStudent.new(class_student_params)

    respond_to do |format|
      if @class_student.save
        format.html { redirect_to @class_student, notice: "Class student was successfully created." }
        format.json { render :show, status: :created, location: @class_student }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @class_student.errors, status: :unprocessable_entity }
      end
    end
  end

  # Update the details of an existing class student.
  def update
    respond_to do |format|
      if @class_student.update(class_student_params)
        format.html { redirect_to class_student_url(@class_student), notice: "Class student was successfully updated." }
        format.json { render :show, status: :ok, location: @class_student }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @class_student.errors, status: :unprocessable_entity }
      end
    end
  end

  # Update the school class and semester for a specific student.
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

  # Delete a class student record.
  def destroy
    @class_student.destroy!

    respond_to do |format|
      format.html { redirect_to class_students_url, notice: "Class student was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  # Set the class student object based on the provided ID.
  def set_class_student
    @class_student = ClassStudent.find(params[:id])
  end

  # Permit only trusted parameters for class student.
  def class_student_params
    params.require(:class_student).permit(:student_id, :school_class_id)
  end
end
