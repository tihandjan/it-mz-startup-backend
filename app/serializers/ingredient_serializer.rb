class IngredientSerializer < ActiveModel::Serializer
  attributes :id, :name, :calories, :image
end
