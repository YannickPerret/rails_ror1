class SchoolClassesController < ApplicationController
  before_action :set_school_class, only: %i[ show edit update destroy ]

  def selected_teacher(branch, school_class)
    teacher_conduct = TeacherConductSchoolClass.find_by(branch: branch, school_class: school_class)
    teacher_conduct&.teacher_id
  end

  def show_notes
    @school_class = SchoolClass.find(params[:id])
    @students = @school_class.students
    @branches = @school_class.branches
  
    @notes = {}
    @students.each do |student|
      @notes[student.id] = {}
      @branches.each do |branch|
        note_record = Note.joins(:note_evaluate_branches)
                          .where(user_id: student.id, note_evaluate_branches: { branch_id: branch.id })
                          .first
        @notes[student.id][branch.id] = note_record
      end
    end
  end
  
  

 # GET /school_classes/:id/edit_branches
 def edit_branches
  @school_class = SchoolClass.find(params[:id])
  @available_branches = Branch.all
  @teachers = User.where(type: 'Teacher')
end

def update_branches
  @school_class = SchoolClass.find(params[:id])

  submitted_branch_ids = params[:school_class][:branch_ids].reject(&:blank?).map(&:to_i)
  current_branch_ids = @school_class.branch_ids

  branches_to_add = submitted_branch_ids - current_branch_ids
  branches_to_remove = current_branch_ids - submitted_branch_ids

  ActiveRecord::Base.transaction do
    @school_class.branch_ids += branches_to_add
    @school_class.branch_ids -= branches_to_remove
  end

  if @school_class.save
    redirect_to @school_class, notice: 'Les branches ont été mises à jour avec succès.'
  else
    render :edit_branches, alert: 'Une erreur est survenue.'
  end
end

  # GET /school_classes or /school_classes.json
  def index
    @school_classes = SchoolClass.all
  end

  # GET /school_classes/1 or /school_classes/1.json
  def show
    @students = @school_class.students
    @branches = @school_class.branches
  end

  # GET /school_classes/ne
  def new
    @school_class = SchoolClass.new
    @teachers = Teacher.all
  end

  # GET /school_classes/1/edit
  def edit
    @teachers = Teacher.all
  end

  # POST /school_classes or /school_classes.json
  def create
    @school_class = SchoolClass.new(school_class_params)
    respond_to do |format|
      if @school_class.save
        format.html { redirect_to school_class_url(@school_class), notice: "School class was successfully created." }
        format.json { render :show, status: :created, location: @school_class }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @school_class.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /school_classes/1 or /school_classes/1.json
  def update
    respond_to do |format|
      if @school_class.update(school_class_params)
        format.html { redirect_to school_class_url(@school_class), notice: "School class was successfully updated." }
        format.json { render :show, status: :ok, location: @school_class }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @school_class.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /school_classes/1 or /school_classes/1.json
  def destroy
    @school_class.destroy!

    respond_to do |format|
      format.html { redirect_to school_classes_url, notice: "School class was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_school_class
      @school_class = SchoolClass.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def school_class_params
      params.require(:school_class).permit(:name, :status, teacher_ids: [])
    end

    def school_class_branches_params
      params.require(:school_class).permit(branch_ids: [])
    end

    def update_branches_and_teachers
      ActiveRecord::Base.transaction do
        @school_class.branch_ids = params[:school_class][:branch_ids].reject(&:blank?)
        params[:school_class][:branches_teachers].each do |branch_id, teacher_id|
          next if teacher_id.blank?
          TeacherConductSchoolClass.find_or_create_by(branch_id: branch_id, school_class_id: @school_class.id) do |tcsc|
            tcsc.teacher_id = teacher_id
          end
        end
      end
      true
    rescue ActiveRecord::RecordInvalid
      false
    end
end
