class Api::V1::IngredientsController < ApplicationController

  def index
    @ingredients = Ingredient.all

    render json: @ingredients
  end

  def create
    return unless current_user
    @ingredient = Ingredient.new ingredient_params
    if @ingredient.save
      render json: @ingredient, status: :created
    else
      render json: @ingredient.errors, status: :unprocessable_entity
    end
  end  

  private

    def ingredient_params
      params.require(:ingredient).permit(:name, :fats, :proteins, :carbohydrates, :calories, :image)
    end

end
