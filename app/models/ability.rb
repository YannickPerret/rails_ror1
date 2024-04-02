class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.supervisor?
      can :manage, :all
    elsif user.teacher?
      can :read, Grade
      can [:create, :update], Grade do |grade|
        user.subjects.include?(grade.subject)
      end
    elsif user.student?
      can :read, Grade, student_id: user.id
    end

    if user.new_record?
      can :read, :dashboard
      can :read, :login
    end
  end
end
