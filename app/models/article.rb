class Article < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy

  def self.ransackable_attributes(auth_object = nil)
    ["body", "created_at", "id", "id_value", "title", "updated_at", "user_id"]
  end

end
