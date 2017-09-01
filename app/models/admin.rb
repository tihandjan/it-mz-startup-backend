class Admin < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :trackable, :validatable, :omniauthable
  include DeviseTokenAuth::Concerns::User

  has_many :recipes, dependent: :nullify, counter_cache: true
  has_many :comments, as: :user, dependent: :destroy
end
