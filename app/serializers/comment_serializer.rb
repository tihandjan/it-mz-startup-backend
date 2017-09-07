class CommentSerializer < ActiveModel::Serializer
  attributes :id, :content, :user, :liked, :likes, :created_at
  has_one :user
  has_many :comments

  def liked
    !object.votes.find_by(user_id: scope.id).blank? if scope
  end

  def likes
    object.votes.count
  end

end
