class TeachersController < ApplicationController
    before_action :set_teacher, only: %i[ show edit update destroy ]
    before_action :set_school_classes, only: %i[new edit]

    def index
        @teachers = Teacher.all
    end

    def show
        @teacher = Teacher.find(params[:id])
    end

    def new
        @teacher = Teacher.new
        @school_classes = SchoolClass.all
    end

    def edit
        @teacher = Teacher.find(params[:id])
    end

    def create
        @teacher = Teacher.new(teacher_params)
        respond_to do |format|
            if @teacher.save
                format.html { redirect_to teacher_url(@teacher), notice: "Teacher was successfully created." }
                format.json { render :show, status: :created, location: @teacher }
            else
                format.html { render :new, status: :unprocessable_entity }
                format.json { render json: @teacher.errors, status: :unprocessable_entity }
            end
        end
    end

    def update
        respond_to do |format|
            if @teacher.update(teacher_params)
                format.html { redirect_to teacher_url(@teacher), notice: "Teacher was successfully updated." }
                format.json { render :show, status: :ok, location: @teacher }
            else
                format.html { render :edit, status: :unprocessable_entity }
                format.json { render json: @teacher.errors, status: :unprocessable_entity }
            end
        end
    end

    def destroy
        @teacher.destroy!

        respond_to do |format|
            format.html { redirect_to teachers_url, notice: "Teacher was successfully destroyed." }
            format.json { head :no_content }
        end
    end

    private

    def set_school_classes
        @school_classes = SchoolClass.all
    end 

    def set_teacher
        @teacher = Teacher.find(params[:id])
    end

    def teacher_params
        params.require(:teacher).permit(:firstname, :lastname, :address, :npa, :city, :email, :phoneNumber, :status, :acronym, :password, :password_digest, :type, { school_class_ids: [] })
    end
end
