class Api::V1::RecipesIngredientsController < ApplicationController
  before_action :set_r_i, only: [:destroy]

  def destroy
    return if !current_user
    @r_i.destroy
  end

  def create
    @r_i = RecipesIngredient.new r_i_params
    if @r_i.save
      render json: @r_i, status: :created
    else
      render json: @r_i.errors, status: :unprocessable_entity
    end
  end

  private

  def r_i_params
    params.require(:recipes_ingredient).permit(:ingredient_id, :amount, :unit, :recipe_id)
  end

  def set_r_i
    @r_i = RecipesIngredient.find(params[:id])
  end

end
