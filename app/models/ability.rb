class Ability
  include CanCan::Ability
  
  def initialize(user)
    user ||= User.new # guest user
    
    if user.role == "admin"
      can :manage, :all
    else
      if user.role == "employee"
        can :manage, Document
        can :manage, DocumentsUser
      end
      if user.role == "customer"
        can :manage, DocumentsUser
        can [:my_files], [Document]
      end
    end
  end
end
