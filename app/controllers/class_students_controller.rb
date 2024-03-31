class ClassStudentsController < ApplicationController
  before_action :set_class_student, only: %i[ show edit update destroy ]

  # GET /class_students or /class_students.json
  def index
    @class_students = ClassStudent.all
  end

  # GET /class_students/1 or /class_students/1.json
  def show
  end

  # GET /class_students/new
  def new
    @class_student = ClassStudent.new
  end

  # GET /class_students/1/edit
  def edit
  end

  # POST /class_students or /class_students.json
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

  # PATCH/PUT /class_students/1 or /class_students/1.json
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

  # DELETE /class_students/1 or /class_students/1.json
  def destroy
    @class_student.destroy!

    respond_to do |format|
      format.html { redirect_to class_students_url, notice: "Class student was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_class_student
      @class_student = ClassStudent.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
  def class_student_params
    params.require(:class_student).permit(:student_id, :school_class_id)
  end
end
