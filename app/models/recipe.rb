class Recipe < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: [:slugged, :history, :finders]
  def should_generate_new_friendly_id?
      slug.blank? || title_changed?
  end
  belongs_to :user
end
