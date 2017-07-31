class Api::V1::RecipeSerializer < ActiveModel::Serializer
  attributes :id, :title, :summary, :created_at, :image, :complexity, :time, :porsion, :calories, :rating
  has_one :user
  has_one :country
  has_one :category
  has_one :sub_category
  has_one :admin, key: 'user'
  has_many :steps
  has_many :ingredients
  has_many :recipes_ingredients
end
