class Api::V1::IngredientSerializer < ActiveModel::Serializer
  attributes :id, :name, :calories, :image
end
