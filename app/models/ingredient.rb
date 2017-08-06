class Ingredient < ApplicationRecord
    has_many :recipes_ingredients, dependent: :destroy 
    has_many :recipes, through: :recipes_ingredients
    mount_base64_uploader :image, IngredientImageUploader
    validates :name, presence: true, length: {minimum: 3, maximum: 40}, uniqueness: { case_sensitive: false }
end
