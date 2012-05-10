class Ability
  include CanCan::Ability

  def initialize(user)

    user ||= User.new  # guest user (not logged in)

    # admins can access 
    if user.admin?
      can :index, Feedback::Comment
    end
    
  end
end
