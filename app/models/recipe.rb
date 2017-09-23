class Recipe < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: [:slugged, :history, :finders]
  def should_generate_new_friendly_id?
      slug.blank? || title_changed?
  end
  belongs_to :user
  belongs_to :admin
  belongs_to :category
  belongs_to :sub_category
  belongs_to :country
  has_many :steps, -> { asc_order }, dependent: :destroy
  has_many :recipes_ingredients, dependent: :destroy
  has_many :ingredients, through: :recipes_ingredients
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :votes, as: :votable, dependent: :destroy

  validates :title, presence: true, length: { minimum: 5, maximum: 120 }
  validates :summary, length: { minimum: 5, maximum: 500 }
  validates :image, presence: true
  validates :time, presence: true
  validates :porsion, presence: true
  validates :complexity, presence: true
  validates :publish, presence: true
  validate :validate_complexity

  mount_base64_uploader :image, RecipeImageUploader

  def validate_complexity
    errors[:complexity] = 'Выберите уровень сложность' if complexity == 'Сложность готовки'
  end
end
