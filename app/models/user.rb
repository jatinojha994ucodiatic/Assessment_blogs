class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :articles, dependent: :destroy

  after_create :assign_default_role

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "email", "encrypted_password", "id", "id_value", "remember_created_at", "reset_password_sent_at", "reset_password_token", "updated_at"]
  end
  
  def self.ransackable_associations(auth_object = nil)
    ["articles"]
  end
  
  private
    def assign_default_role
      self.add_role(:user) if self.roles.blank?
    end
end
