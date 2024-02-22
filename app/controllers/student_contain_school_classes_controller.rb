class StudentContainSchoolClassesController < ApplicationController
  before_action :set_student_contain_school_class, only: %i[ show edit update destroy ]

  # GET /student_contain_school_classes or /student_contain_school_classes.json
  def index
    @student_contain_school_classes = StudentContainSchoolClass.all
  end

  # GET /student_contain_school_classes/1 or /student_contain_school_classes/1.json
  def show
  end

  # GET /student_contain_school_classes/new
  def new
    @student_contain_school_class = StudentContainSchoolClass.new
  end

  # GET /student_contain_school_classes/1/edit
  def edit
  end

  # POST /student_contain_school_classes or /student_contain_school_classes.json
  def create
    @student_contain_school_class = StudentContainSchoolClass.new(student_contain_school_class_params)

    respond_to do |format|
      if @student_contain_school_class.save
        format.html { redirect_to student_contain_school_class_url(@student_contain_school_class), notice: "Student contain school class was successfully created." }
        format.json { render :show, status: :created, location: @student_contain_school_class }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @student_contain_school_class.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /student_contain_school_classes/1 or /student_contain_school_classes/1.json
  def update
    respond_to do |format|
      if @student_contain_school_class.update(student_contain_school_class_params)
        format.html { redirect_to student_contain_school_class_url(@student_contain_school_class), notice: "Student contain school class was successfully updated." }
        format.json { render :show, status: :ok, location: @student_contain_school_class }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @student_contain_school_class.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /student_contain_school_classes/1 or /student_contain_school_classes/1.json
  def destroy
    @student_contain_school_class.destroy!

    respond_to do |format|
      format.html { redirect_to student_contain_school_classes_url, notice: "Student contain school class was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student_contain_school_class
      @student_contain_school_class = StudentContainSchoolClass.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def student_contain_school_class_params
      params.require(:student_contain_school_class).permit(:people_id, :school_year, :schoolClass_id)
    end
end
