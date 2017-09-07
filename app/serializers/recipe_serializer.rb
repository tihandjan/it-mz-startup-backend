class RecipeSerializer < ActiveModel::Serializer
  attributes :id, :title, :summary, :created_at, :image, :complexity, :time, :porsion, :calories, :rating, :slug, :liked, :likes, :category_id, :sub_category_id
  has_one :user
  has_one :country
  has_one :category
  has_one :sub_category
  has_many :steps
  has_many :ingredients
  has_many :recipes_ingredients

  def liked
    !object.votes.find_by(user_id: scope.id).blank? if scope
  end

  def likes
    object.votes.count
  end
end
