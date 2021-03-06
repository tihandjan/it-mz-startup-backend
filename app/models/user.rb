class User < ActiveRecord::Base
  devise :database_authenticatable,
          :recoverable, :rememberable, :trackable, :validatable, :registerable
  include DeviseTokenAuth::Concerns::User
  has_many :recipes, dependent: :nullify, counter_cache: true
  has_many :comments, as: :user, dependent: :destroy
end
