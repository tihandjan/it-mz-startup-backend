class Recipe < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: [:slugged, :history, :finders]
  def should_generate_new_friendly_id?
      slug.blank? || title_changed?
  end
  belongs_to :user
  belongs_to :admin
  has_many :steps, dependent: :destroy
  validates :title, presence: true, length: { minimum: 5, maximum: 120 }
  validates :summary, length: { minimum: 5, maximum: 180 }
  validates :image, presence: true
  validates :time, presence: true
  validates :porsion, presence: true
  validates :complexity, presence: true
  validates :publish, presence: true
  validate :validate_complexity

  mount_base64_uploader :image, RecipeImageUploader
  accepts_nested_attributes_for :steps, allow_destroy: true

  def validate_complexity
    errors[:complexity] = 'Выберите уровень сложность' if complexity == 'Сложность готовки'
  end
end
