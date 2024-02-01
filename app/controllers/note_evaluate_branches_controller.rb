class NoteEvaluateBranchesController < ApplicationController
  before_action :set_note_evaluate_branch, only: %i[ show edit update destroy ]

  # GET /note_evaluate_branches or /note_evaluate_branches.json
  def index
    @note_evaluate_branches = NoteEvaluateBranch.all
  end

  # GET /note_evaluate_branches/1 or /note_evaluate_branches/1.json
  def show
  end

  # GET /note_evaluate_branches/new
  def new
    @note_evaluate_branch = NoteEvaluateBranch.new
  end

  # GET /note_evaluate_branches/1/edit
  def edit
  end

  # POST /note_evaluate_branches or /note_evaluate_branches.json
  def create
    @note_evaluate_branch = NoteEvaluateBranch.new(note_evaluate_branch_params)

    respond_to do |format|
      if @note_evaluate_branch.save
        format.html { redirect_to note_evaluate_branch_url(@note_evaluate_branch), notice: "Note evaluate branch was successfully created." }
        format.json { render :show, status: :created, location: @note_evaluate_branch }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @note_evaluate_branch.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /note_evaluate_branches/1 or /note_evaluate_branches/1.json
  def update
    respond_to do |format|
      if @note_evaluate_branch.update(note_evaluate_branch_params)
        format.html { redirect_to note_evaluate_branch_url(@note_evaluate_branch), notice: "Note evaluate branch was successfully updated." }
        format.json { render :show, status: :ok, location: @note_evaluate_branch }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @note_evaluate_branch.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /note_evaluate_branches/1 or /note_evaluate_branches/1.json
  def destroy
    @note_evaluate_branch.destroy!

    respond_to do |format|
      format.html { redirect_to note_evaluate_branches_url, notice: "Note evaluate branch was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_note_evaluate_branch
      @note_evaluate_branch = NoteEvaluateBranch.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def note_evaluate_branch_params
      params.require(:note_evaluate_branch).permit(:dateEval, :note_id, :branch_id)
    end
end
