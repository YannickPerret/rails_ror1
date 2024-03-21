class UserController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]

  # GET /users or /users.json
  def index
    @users = User.all
  end

  # GET /users/1 or /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)
  
    respond_to do |format|
      if @user.save
        handle_class_assignment(@user)
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.turbo_stream { redirect_to @user, status: :created }
      else
        format.html { redirect_to new_user_url, alert: 'There were errors.' }
        format.turbo_stream { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to user_url(@user), notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy!

    respond_to do |format|
      format.html { redirect_to users_url, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:firstname, :lastname, :address, :npa, :city, :email, :phoneNumber, :status, :acronym, :password_digest, :role_id, :school_class_id)
    end

    def handle_class_assignment(user)
      school_class_id = params[:user][:school_class_id]
      return unless school_class_id.present?
        
      if user.role.name == 'Student'
        StudentContainSchoolClass.create(user: user, school_class_id: school_class_id)
      elsif user.role.name == 'Teacher'
        TeacherConductSchoolClass.create(user: user, school_class_id: school_class_id)
      end
    end
    
end
