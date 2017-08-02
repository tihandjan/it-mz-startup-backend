class User < ActiveRecord::Base
  devise :database_authenticatable,
          :recoverable, :rememberable, :trackable, :validatable, :registerable
  include DeviseTokenAuth::Concerns::User
  has_many :recipies, dependent: :nullify
end
