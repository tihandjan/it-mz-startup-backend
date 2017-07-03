class Api::V1::RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :update, :destroy]
  # GET /api/v1/recipies
  def index
    @recipies = Recipe.all

    render json: @recipies
  end

  # GET /api/v1/recipies/1
  def show
    render json: @recipe
  end

  # POST /api/v1/recipies
  def create
    @recipe = Recipe.new(recipe_params)

    if @recipe.save
      render json: @recipe, status: :created
    else
      render json: @recipe.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/recipies/1
  def update
    if @recipe.update(recipe_params)
      render json: @recipe
    else
      render json: @recipe.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/recipies/1
  def destroy
    @recipe.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe
      @recipe = Recipe.friendly.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def recipe_params
      recipe = params.require(:recipe).permit(:title, :summary, :image, :time, :portion, :complexity, :publish)
      recipe[:user_id] = current_member.id
      recipe
    end
end
