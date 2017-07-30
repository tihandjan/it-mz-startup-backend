class Category < ApplicationRecord
  has_many :recipes
  has_many :sub_categories, dependent: :destroy
  validates :name, presence: true
end
