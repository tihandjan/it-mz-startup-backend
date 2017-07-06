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
    @recipe = Recipe.new do |recipe|
      recipe.title = params[:title]
      recipe.summary = params[:summary]
      recipe.time = params[:time]
      recipe.image = params[:file]
      recipe.publish = params[:publish]
      recipe.porsion = params[:porsion]
      recipe.complexity = params[:complexity]
      if current_api_v1_user
        recipe.user_id = current_api_v1_user.id
      elsif current_api_v1_admin
        recipe.admin_id = current_api_v1_admin.id
        recipe.user_type = 'admin'
      end
    end
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
      recipe = params.require(:recipe).permit(:title, :file, :summary, :time, :portion, :complexity, :publish)
    end
end