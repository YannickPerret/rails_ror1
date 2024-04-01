# ==============================================================================
# Filename : grades_controller.rb
# Author         : tchoune
# Created        : 2024-04-01
# Last updated : 2024-04-01
# ==============================================================================
class GradesController < ApplicationController
  before_action :set_grade, only: [:show, :edit, :update, :destroy]

  # GET /grades or /grades.json
  def index
    if current_user.student?
      @student = Student.find(params[:student_id])
      @grades = @student.grades
    else
      @grades = Grade.all
    end
  end

  # GET /grades/1 or /grades/1.json
  def show
  end

  # GET /grades/new
  def new
    @student = Student.find(params[:student_id])
    @semester = Semester.find(params[:semester_id])
    @subject = Subject.find(params[:subject_id])
    @grade = Grade.new(student_id: @student.id, semester_id: @semester.id, subject_id: @subject.id)
  end


  # GET /grades/1/edit
  def edit
    @grade = Grade.find(params[:id])
    @student = @grade.student
    @semester = @grade.semester
    @subject = @grade.subject
  end

  # POST /grades or /grades.json
  def create
    @grade = Grade.new(grade_params)
    if @grade.save
      redirect_to student_path(@grade.student_id), notice: 'Grade was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end




  # PATCH/PUT /grades/1 or /grades/1.json
  def update
    @grade = Grade.find(params[:id])
    if @grade.update(grade_params)
      redirect_to student_path(@grade.student_id), notice: 'Grade was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /grades/1 or /grades/1.json
  def destroy
    @grade.destroy!

    respond_to do |format|
      format.html { redirect_to grades_url, notice: "Grade was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_grade
    @grade = Grade.find(params[:id])
  end

    # Only allow a list of trusted parameters through.
  def grade_params
    params.require(:grade).permit(:value, :student_id, :subject_id, :semester_id)
  end



end
