class CategorySerializer < ActiveModel::Serializer
  attributes :id, :name, :slug
  has_many :sub_categories
  has_many :recipes
end
