# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Article

    return unless user.present?
    can :manage, Article, user: user

    return unless user.has_role?(:admin)
    can :read, article
    
  end
end
