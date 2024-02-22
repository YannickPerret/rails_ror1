class BranchHistoriesController < ApplicationController
  before_action :set_branch_history, only: %i[ show edit update destroy ]

  # GET /branch_histories or /branch_histories.json
  def index
    @branch_histories = BranchHistory.all
  end

  # GET /branch_histories/1 or /branch_histories/1.json
  def show
  end

  # GET /branch_histories/new
  def new
    @branch_history = BranchHistory.new
  end

  # GET /branch_histories/1/edit
  def edit
  end

  # POST /branch_histories or /branch_histories.json
  def create
    @branch_history = BranchHistory.new(branch_history_params)

    respond_to do |format|
      if @branch_history.save
        format.html { redirect_to branch_history_url(@branch_history), notice: "Branch history was successfully created." }
        format.json { render :show, status: :created, location: @branch_history }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @branch_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /branch_histories/1 or /branch_histories/1.json
  def update
    respond_to do |format|
      if @branch_history.update(branch_history_params)
        format.html { redirect_to branch_history_url(@branch_history), notice: "Branch history was successfully updated." }
        format.json { render :show, status: :ok, location: @branch_history }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @branch_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /branch_histories/1 or /branch_histories/1.json
  def destroy
    @branch_history.destroy!

    respond_to do |format|
      format.html { redirect_to branch_histories_url, notice: "Branch history was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_branch_history
      @branch_history = BranchHistory.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def branch_history_params
      params.require(:branch_history).permit(:name, :effective_date, :end_date, :branch_id)
    end
end
