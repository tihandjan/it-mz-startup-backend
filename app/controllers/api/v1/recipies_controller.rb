class Api::V1::RecipiesController < ApplicationController
  before_action :set_recipe, only: [:show, :update, :destroy]

  # GET /api/v1/recipes
  def index
    @recipies = Recipe.all

    render json: @recipies
  end

  # GET /api/v1/recipes/1
  def show
    render json: @recipe
  end

  # POST /api/v1/recipes
  def create
    @recipe = Recipe.new(recipe_params)

    if @recipe.save
      render json: @recipe, status: :created, location: @recipe
    else
      render json: @recipe.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/recipes/1
  def update
    if @recipe.update(recipe_params)
      render json: @recipe
    else
      render json: @recipe.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/recipes/1
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
      params.require(:recipe).permit(:title, :summary, :image, :time, :portion, :complexity, :publish)
    end
end
