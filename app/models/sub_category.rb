class SubCategory < ApplicationRecord
  has_many :recipes
  belongs_to :category
  validates :name, presence: true
end
