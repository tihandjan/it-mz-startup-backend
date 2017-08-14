class Api::V1::RecipesIngredientSerializer < ActiveModel::Serializer
  attributes :id, :amount, :unit, :ingredient_id
end
