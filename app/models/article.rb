class Article < ApplicationRecord
  resourcify
  
  belongs_to :user
  has_many :users, -> { distinct }, through: :roles, class_name: 'User', source: :users

  validates :title, :body, presence: true
  
  def self.ransackable_attributes(auth_object = nil)
    ["body", "created_at", "id", "id_value", "title", "updated_at", "user_id"]
  end

end
