class RecipesIngredient < ApplicationRecord
  belongs_to :recipe
  belongs_to :ingredient

  validates :amount, presence: true
  validates :ingredient_id, presence: true
  validate :validate_amount
  
  private
 
  def validate_amount
    errors[:amount] << "can't be 0" if amount.nil? || amount <= 0 
  end
end
