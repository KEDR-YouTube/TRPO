class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # гость

    if user.has_role? :seller
      can :manage, Ecomm
    elsif user.has_role? :client
      can :read, Ecomm
    end
  end
end