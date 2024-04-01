# ==============================================================================
# Filename : class_subject_semesters_controller.rb
# Author         : tchoune
# Created        : 2024-04-01
# Last updated : 2024-04-01
# ==============================================================================
class ClassSubjectSemestersController < ApplicationController
  before_action :set_class_subject_semester, only: %i[ show edit update destroy ]

  # GET /class_subject_semesters or /class_subject_semesters.json
  def index
    @class_subject_semesters = ClassSubjectSemester.all
  end

  # GET /class_subject_semesters/1 or /class_subject_semesters/1.json
  def show
  end

  # GET /class_subject_semesters/new
  def new
    @class_subject_semester = ClassSubjectSemester.new
  end

  # GET /class_subject_semesters/1/edit
  def edit
  end

  # POST /class_subject_semesters or /class_subject_semesters.json
  def create
    school_class_id = class_subject_semester_params[:school_class_id]
    semester_id = class_subject_semester_params[:semester_id]
    params[:class_subject_semester][:subject_ids].reject(&:empty?).each do |subject_id|
      ClassSubjectSemester.create(
        school_class_id: school_class_id,
        semester_id: semester_id,
        subject_id: subject_id
      )
    end
    redirect_to class_subject_semesters_path, notice: 'Subjects were successfully added.'
  end


  # PATCH/PUT /class_subject_semesters/1 or /class_subject_semesters/1.json
  def update
    respond_to do |format|
      if @class_subject_semester.update(class_subject_semester_params)
        format.html { redirect_to class_subject_semester_url(@class_subject_semester), notice: "Class subject semester was successfully updated." }
        format.json { render :show, status: :ok, location: @class_subject_semester }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @class_subject_semester.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /class_subject_semesters/1 or /class_subject_semesters/1.json
  def destroy
    @class_subject_semester.destroy!

    respond_to do |format|
      format.html { redirect_to class_subject_semesters_url, notice: "Class subject semester was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_class_subject_semester
      @class_subject_semester = ClassSubjectSemester.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
  def class_subject_semester_params
    params.require(:class_subject_semester).permit(:school_class_id, :semester_id)
  end


end
