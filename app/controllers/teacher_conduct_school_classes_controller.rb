class TeacherConductSchoolClassesController < ApplicationController
  before_action :set_teacher_conduct_school_class, only: %i[ show edit update destroy ]

  # GET /teacher_conduct_school_classes or /teacher_conduct_school_classes.json
  def index
    @teacher_conduct_school_classes = TeacherConductSchoolClass.all
  end

  # GET /teacher_conduct_school_classes/1 or /teacher_conduct_school_classes/1.json
  def show
  end

  # GET /teacher_conduct_school_classes/new
  def new
    @teacher_conduct_school_class = TeacherConductSchoolClass.new
  end

  # GET /teacher_conduct_school_classes/1/edit
  def edit
  end

  # POST /teacher_conduct_school_classes or /teacher_conduct_school_classes.json
  def create
    @teacher_conduct_school_class = TeacherConductSchoolClass.new(teacher_conduct_school_class_params)

    respond_to do |format|
      if @teacher_conduct_school_class.save
        format.html { redirect_to teacher_conduct_school_class_url(@teacher_conduct_school_class), notice: "Teacher conduct school class was successfully created." }
        format.json { render :show, status: :created, location: @teacher_conduct_school_class }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @teacher_conduct_school_class.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /teacher_conduct_school_classes/1 or /teacher_conduct_school_classes/1.json
  def update
    respond_to do |format|
      if @teacher_conduct_school_class.update(teacher_conduct_school_class_params)
        format.html { redirect_to teacher_conduct_school_class_url(@teacher_conduct_school_class), notice: "Teacher conduct school class was successfully updated." }
        format.json { render :show, status: :ok, location: @teacher_conduct_school_class }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @teacher_conduct_school_class.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teacher_conduct_school_classes/1 or /teacher_conduct_school_classes/1.json
  def destroy
    @teacher_conduct_school_class.destroy!

    respond_to do |format|
      format.html { redirect_to teacher_conduct_school_classes_url, notice: "Teacher conduct school class was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_teacher_conduct_school_class
      @teacher_conduct_school_class = TeacherConductSchoolClass.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def teacher_conduct_school_class_params
      params.require(:teacher_conduct_school_class).permit(:people_id, :schoolClass_id)
    end
end
