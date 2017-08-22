class Comment < ApplicationRecord
  belongs_to :commentable, polymorphic: true
  belongs_to :user, polymorphic: true
  has_many :comments, as: :commentable, dependent: :destroy

  validates :content, presence: true, length: {maximum: 1000}
end
