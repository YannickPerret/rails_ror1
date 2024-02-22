class SchoolClassStudyBranchesController < ApplicationController
  before_action :set_school_class_study_branch, only: %i[ show edit update destroy ]

  # GET /school_class_study_branches or /school_class_study_branches.json
  def index
    @school_class_study_branches = SchoolClassStudyBranch.all
  end

  # GET /school_class_study_branches/1 or /school_class_study_branches/1.json
  def show
  end

  # GET /school_class_study_branches/new
  def new
    @school_class_study_branch = SchoolClassStudyBranch.new
  end

  # GET /school_class_study_branches/1/edit
  def edit
  end

  # POST /school_class_study_branches or /school_class_study_branches.json
  def create
    @school_class_study_branch = SchoolClassStudyBranch.new(school_class_study_branch_params)

    respond_to do |format|
      if @school_class_study_branch.save
        format.html { redirect_to school_class_study_branch_url(@school_class_study_branch), notice: "School class study branch was successfully created." }
        format.json { render :show, status: :created, location: @school_class_study_branch }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @school_class_study_branch.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /school_class_study_branches/1 or /school_class_study_branches/1.json
  def update
    respond_to do |format|
      if @school_class_study_branch.update(school_class_study_branch_params)
        format.html { redirect_to school_class_study_branch_url(@school_class_study_branch), notice: "School class study branch was successfully updated." }
        format.json { render :show, status: :ok, location: @school_class_study_branch }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @school_class_study_branch.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /school_class_study_branches/1 or /school_class_study_branches/1.json
  def destroy
    @school_class_study_branch.destroy!

    respond_to do |format|
      format.html { redirect_to school_class_study_branches_url, notice: "School class study branch was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_school_class_study_branch
      @school_class_study_branch = SchoolClassStudyBranch.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def school_class_study_branch_params
      params.require(:school_class_study_branch).permit(:schoolClass_id, :branch_id)
    end
end
