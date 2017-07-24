class Ingredient < ApplicationRecord
    has_many :recipes_ingredients, dependent: :destroy
    has_many :recipes, through: :recipes_ingredients

    validates :name, presence: true, length: {minimum: 3, maximum: 40}
end
