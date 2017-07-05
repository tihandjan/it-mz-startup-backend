class Admin < ActiveRecord::Base
  # Include default devise modules.
  devise :database_authenticatable,
          :recoverable, :rememberable, :trackable, :validatable
  include DeviseTokenAuth::Concerns::User

  has_many :recipes
end
