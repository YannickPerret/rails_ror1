# ==============================================================================
# Filename   : grades_controller.rb
# Author     : tchoune
# Created    : 2024-04-01
# Last updated : 2024-04-01
# ==============================================================================

class GradesController < ApplicationController
  before_action :set_grade, only: [:show, :edit, :update, :destroy]

  # Display a list of grades for the current user or all grades if user is not a student.
  def index
    if current_user.student?
      @student = Student.find(params[:student_id])
      @grades = @student.grades
    else
      @grades = Grade.all
    end
  end

  # Display the details of a specific grade.
  def show
  end

  # Initialize a new grade object.
  def new
    @student = Student.find(params[:student_id])
    @semester = Semester.find(params[:semester_id])
    @subject = Subject.find(params[:subject_id])
    @grade = Grade.new(student_id: @student.id, semester_id: @semester.id, subject_id: @subject.id)
  end

  # Edit the details of a grade.
  def edit
    @grade = Grade.find(params[:id])
    @student = @grade.student
    @semester = @grade.semester
    @subject = @grade.subject
  end

  # Create a new grade record.
  def create
    @grade = Grade.new(grade_params)
    if @grade.save
      redirect_to student_path(@grade.student_id), notice: 'Grade was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # Update the details of an existing grade.
  def update
    @grade = Grade.find(params[:id])
    if @grade.update(grade_params)
      redirect_to student_path(@grade.student_id), notice: 'Grade was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # Delete a grade record.
  def destroy
    @grade.destroy!

    respond_to do |format|
      format.html { redirect_to grades_url, notice: "Grade was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  # Set the grade object based on the provided ID.
  def set_grade
    @grade = Grade.find(params[:id])
  end

  # Permit only trusted parameters for grade.
  def grade_params
    params.require(:grade).permit(:value, :student_id, :subject_id, :semester_id)
  end
end
