class Ability
  include CanCan::Ability

  def initialize(user)
    if user.persisted?
      can :manage, [GasEntry, Vehicle, Station], :user_id => user.id
      can :manage, User, :id => user.id
    else
      can :create, User
    end
  end
end
