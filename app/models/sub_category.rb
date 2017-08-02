class SubCategory < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: [:slugged, :history, :finders]
  def should_generate_new_friendly_id?
      slug.blank? || name_changed?
  end

  has_many :recipes, dependent: :nullify
  belongs_to :category
  validates :name, presence: true, uniqueness: true
end
