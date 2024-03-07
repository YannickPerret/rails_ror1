module SchoolClassesHelper
    def selected_teacher(branch, school_class)
        teacher_conduct = TeacherConductSchoolClass.find_by(branch: branch, school_class: school_class)
        teacher_conduct&.teacher_id
      end
end
