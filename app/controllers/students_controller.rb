class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update_class, :destroy, :assign_class, :assign_semester]

  def report
    @student = Student.find(params[:id])
  end

  def generate_grade
    @student = Student.find(params[:id])
    @semesters = @student.class_students.map(&:semester)
  end

  def generate_report
    @student = Student.find(params[:id])
    if params[:semester_ids].blank?
      redirect_back(fallback_location: root_path, alert: "Please select at least one semester to generate a report.") and return
    end
    @selected_semesters = Semester.find(params[:semester_ids])

    respond_to do |format|
      format.pdf do
        pdf = Prawn::Document.new
        pdf.text "Report for #{@student.fullname}"

        @selected_semesters.each do |semester|
          pdf.text "Semester: #{semester.name} (#{semester.year})", style: :bold

          class_subjects = @student.class_students.where(semester: semester).map(&:school_class).flat_map(&:class_subject_semesters).select { |cs| cs.semester_id == semester.id }
          subjects = class_subjects.map(&:subject)
          grades = subjects.map { |subject| [subject, @student.grades.find_by(subject: subject, semester: semester)] }.to_h

          pdf.table([["Subject", "Grade"]] + grades.map { |subject, grade| [subject.name, grade ? grade.value : "N/A"] }, width: pdf.bounds.width) do
            cells.padding = 8
            cells.borders = []
            row(0).borders = [:bottom]
            row(0).font_style = :bold
          end

          pdf.move_down 10
        end

        send_data pdf.render, filename: "report.pdf", type: 'application/pdf', disposition: 'attachment'
      end
    end
  end




  def assign_class
    @student = Student.find(params[:id])
    @school_classes = SchoolClass.all
    @semesters = Semester.all
    @class_student = ClassStudent.find_or_initialize_by(student_id: @student.id) # Initialisation de @class_student
  end

  def assign_semester
    @student = Student.find(params[:id])
    @semesters = Semester.all
  end

  def index
    @students = Student.all
  end

  def show
    @student = Student.find(params[:id])
    @semesters_with_subjects = @student.class_students.includes(school_class: { class_subject_semesters: :subject }).each_with_object({}) do |cs, acc|
      cs.school_class.class_subject_semesters.each do |css|
        acc[css.semester] ||= []
        acc[css.semester] << css.subject unless acc[css.semester].map(&:id).include?(css.subject.id)
      end
    end
  end





  def new
    @student = Student.new

  end

  def edit
    @school_classes = SchoolClass.all
    @semesters = Semester.all
    @subjects = Subject.all
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      redirect_to @student, notice: 'Student was successfully created.'
    else
      render :new
    end
  end

  def update
    if @student.update(student_params)
      redirect_to @student, notice: 'Student was successfully updated.'
    else
      render :edit
    end
  end

  def update_class
    @student = Student.find(params[:id])
    @class_student = ClassStudent.new(student_id: @student.id, school_class_id: params[:student][:school_class_id], semester_id: params[:student][:semester_id])

    if @class_student.save
      redirect_to @student, notice: 'School class and semester were successfully assigned.'
    else
      @school_classes = SchoolClass.all
      @semesters = Semester.all
      render :assign_class, status: :unprocessable_entity
    end
  end


  def destroy
    @student.destroy
    redirect_to students_url, notice: 'Student was successfully destroyed.'
  end

  private
  def set_student
    @student = Student.find(params[:id])
  end

  def student_params
    params.require(:student).permit(:firstname, :lastname, :email, :phone, :address, :city, :country, :password)
  end

end
