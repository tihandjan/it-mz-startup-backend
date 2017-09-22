class Api::V1::RecipesIngredientsController < ApplicationController
  before_action :set_r_i, only: [:destroy]

  def destroy
    return if !current_user
    @r_i.destroy
  end

  private

  def set_r_i
    @r_i = RecipesIngredient.find(params[:id])
  end

end
