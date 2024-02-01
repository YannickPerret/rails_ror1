class TeacherTeachBranchesController < ApplicationController
  before_action :set_teacher_teach_branch, only: %i[ show edit update destroy ]

  # GET /teacher_teach_branches or /teacher_teach_branches.json
  def index
    @teacher_teach_branches = TeacherTeachBranch.all
  end

  # GET /teacher_teach_branches/1 or /teacher_teach_branches/1.json
  def show
  end

  # GET /teacher_teach_branches/new
  def new
    @teacher_teach_branch = TeacherTeachBranch.new
  end

  # GET /teacher_teach_branches/1/edit
  def edit
  end

  # POST /teacher_teach_branches or /teacher_teach_branches.json
  def create
    @teacher_teach_branch = TeacherTeachBranch.new(teacher_teach_branch_params)

    respond_to do |format|
      if @teacher_teach_branch.save
        format.html { redirect_to teacher_teach_branch_url(@teacher_teach_branch), notice: "Teacher teach branch was successfully created." }
        format.json { render :show, status: :created, location: @teacher_teach_branch }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @teacher_teach_branch.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /teacher_teach_branches/1 or /teacher_teach_branches/1.json
  def update
    respond_to do |format|
      if @teacher_teach_branch.update(teacher_teach_branch_params)
        format.html { redirect_to teacher_teach_branch_url(@teacher_teach_branch), notice: "Teacher teach branch was successfully updated." }
        format.json { render :show, status: :ok, location: @teacher_teach_branch }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @teacher_teach_branch.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teacher_teach_branches/1 or /teacher_teach_branches/1.json
  def destroy
    @teacher_teach_branch.destroy!

    respond_to do |format|
      format.html { redirect_to teacher_teach_branches_url, notice: "Teacher teach branch was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_teacher_teach_branch
      @teacher_teach_branch = TeacherTeachBranch.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def teacher_teach_branch_params
      params.require(:teacher_teach_branch).permit(:branch_id, :teacher_id)
    end
end
