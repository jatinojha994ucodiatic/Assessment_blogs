# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Article
    can :read, Comment

    return unless user.present?
    can :manage, Article, user: user
    can :manage, Comment, user: user

    return unless user.has_role?(:admin)
    can :read, Article
    can :read, Comment
    
  end
end
