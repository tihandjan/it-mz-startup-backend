class Recipe < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: [:slugged, :history, :finders]
  def should_generate_new_friendly_id?
      slug.blank? || title_changed?
  end
  belongs_to :user

  validates :title, presence: true, length: { minimum: 5, maximum: 120 }
  validates :summary, length: { minimum: 5, maximum: 180 }
  validates :image, presence: true
  validates :time, presence: true
  validates :porsion, presence: true
  validates :complexity, presence: true
  validates :publish, presence: true

  mount_uploader :image, RecipeImageUploader
end
