class TeacherTeachBranchesController < ApplicationController
  before_action :set_teacher_teach_branch, only: %i[ show edit update destroy ]

  # GET /people_teach_branches or /people_teach_branches.json
  def index
    @people_teach_branches = PeopleTeachBranch.all
  end

  # GET /people_teach_branches/1 or /people_teach_branches/1.json
  def show
  end

  # GET /people_teach_branches/new
  def new
    @people_teach_branch = PeopleTeachBranch.new
  end

  # GET /people_teach_branches/1/edit
  def edit
  end

  # POST /people_teach_branches or /people_teach_branches.json
  def create
    @people_teach_branch = PeopleTeachBranch.new(people_teach_branch_params)

    respond_to do |format|
      if @people_teach_branch.save
        format.html { redirect_to people_teach_branch_url(@people_teach_branch), notice: "People teach branch was successfully created." }
        format.json { render :show, status: :created, location: @people_teach_branch }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @people_teach_branch.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /people_teach_branches/1 or /people_teach_branches/1.json
  def update
    respond_to do |format|
      if @people_teach_branch.update(people_teach_branch_params)
        format.html { redirect_to people_teach_branch_url(@people_teach_branch), notice: "People teach branch was successfully updated." }
        format.json { render :show, status: :ok, location: @people_teach_branch }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @people_teach_branch.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /people_teach_branches/1 or /people_teach_branches/1.json
  def destroy
    @people_teach_branch.destroy!

    respond_to do |format|
      format.html { redirect_to people_teach_branches_url, notice: "People teach branch was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_teacher_teach_branch
      @teacher_teach_branch = TeacherTeachBranch.find(params[:id])
    end

    def teacher_teach_branch_params
      params.require(:teacher_teach_branch).permit(:user_id, :branch_id)
    end
end
