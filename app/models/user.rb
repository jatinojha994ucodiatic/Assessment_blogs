class User < ApplicationRecord
  rolify
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_many :articles, dependent: :destroy

  after_create :assign_default_role

  validate :must_have_role, on: :update
  
  private
    def assign_default_role
      self.add_role(:user) if self.roles.blank?
    end

    def must_have_role
      unless self.roles.any?
        self.errors.add(:roles, "Must have 1 role!")
      end
    end
end
