class Api::V1::RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :update, :destroy]

  def index
    @recipies = Recipe.order(created_at: :desc)

    render json: @recipies
  end

  def show
    render json: @recipe
  end

  def create
      @recipe = Recipe.new recipe_params
      if current_api_v1_user
        @recipe.user_id = current_api_v1_user.id
      elsif current_api_v1_admin
        @recipe.admin_id = current_api_v1_admin.id
        @recipe.user_type = 'admin'
      else
        return
      end
      params[:steps].each do |step|
        @recipe.steps.new do |st|
          st.step = step[:step]
	  st.image = step[:image]
   	  st.content = step[:content]
        end
      end
      params[:recipes_ingredients].each do |ingredient|
        @recipe.recipes_ingredients.new do |ing|
          ing.ingredient_id = ingredient[:ingredient_id]
          ing.amount = ingredient[:amount]
          ing.unit = ingredient[:unit]
        end
      end
      if @recipe.save
        render json: @recipe, status: :created
      else
        render json: @recipe.errors, status: :unprocessable_entity
    end
  end

  def update
    if @recipe.update(recipe_params)
      render json: @recipe
    else
      render json: @recipe.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @recipe.destroy
  end

  private
    def set_recipe
      @recipe = Recipe.friendly.find(params[:id])
    end

    def recipe_params
      params.require(:recipe).permit(:title, :image, :summary, :time, :porsion, :complexity, :publish, :category_id, :sub_category_id, :country_id)
    end

end
