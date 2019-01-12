class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    can :read, Article
    can :read, Comment
    if user.new_record? # we are not logged in
      can :create, Comment
    elsif user.role == 'admin'
      can :manage, :all
    elsif user.role == 'editor'
      can :manage, Article
      can :manage, Comment
    else
      can :manage, Article, user_id: user.id
      can :manage, Comment, article: { user_id: user.id }
    end
  end
end
