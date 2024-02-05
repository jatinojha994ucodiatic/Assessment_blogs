class Article < ApplicationRecord
  resourcify
  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders]
  
  belongs_to :user
  has_many :users, -> { distinct }, through: :roles, class_name: 'User', source: :users
  has_many :comments, dependent: :destroy

  validates :title, :body, presence: true
  
  def self.ransackable_attributes(auth_object = nil)
    ["body", "created_at", "id", "id_value", "title", "updated_at", "user_id"]
  end

end
