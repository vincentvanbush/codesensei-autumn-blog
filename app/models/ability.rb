class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Article
    can :read, Comment
    can :read, Picture
    can :create, Comment

    return if user == nil

    if user.role == 'admin'
      can :manage, :all
    elsif user.role == 'editor'
      can :manage, Article
      can :manage, Comment
      can :manage, Picture
    elsif user.role == 'user'
      can :manage, Article, user_id: user.id
      can :manage, Comment, article: { user_id: user.id }
      can :manage, Picture, article: { user_id: user.id }
    end
  end
end
