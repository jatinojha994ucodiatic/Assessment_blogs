class Comment < ApplicationRecord
  belongs_to :article
  belongs_to :user#, through: :article

  validates :comment, presence: true, length: {minimum:10, maximum:100}
end
