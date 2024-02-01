class StudentStudyBranchesController < ApplicationController
  before_action :set_student_study_branch, only: %i[ show edit update destroy ]

  # GET /student_study_branches or /student_study_branches.json
  def index
    @student_study_branches = StudentStudyBranch.all
  end

  # GET /student_study_branches/1 or /student_study_branches/1.json
  def show
  end

  # GET /student_study_branches/new
  def new
    @student_study_branch = StudentStudyBranch.new
  end

  # GET /student_study_branches/1/edit
  def edit
  end

  # POST /student_study_branches or /student_study_branches.json
  def create
    @student_study_branch = StudentStudyBranch.new(student_study_branch_params)

    respond_to do |format|
      if @student_study_branch.save
        format.html { redirect_to student_study_branch_url(@student_study_branch), notice: "Student study branch was successfully created." }
        format.json { render :show, status: :created, location: @student_study_branch }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @student_study_branch.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /student_study_branches/1 or /student_study_branches/1.json
  def update
    respond_to do |format|
      if @student_study_branch.update(student_study_branch_params)
        format.html { redirect_to student_study_branch_url(@student_study_branch), notice: "Student study branch was successfully updated." }
        format.json { render :show, status: :ok, location: @student_study_branch }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @student_study_branch.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /student_study_branches/1 or /student_study_branches/1.json
  def destroy
    @student_study_branch.destroy!

    respond_to do |format|
      format.html { redirect_to student_study_branches_url, notice: "Student study branch was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student_study_branch
      @student_study_branch = StudentStudyBranch.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def student_study_branch_params
      params.require(:student_study_branch).permit(:student_id, :branch_id)
    end
end
