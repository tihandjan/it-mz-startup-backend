class Api::V1::RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :update, :destroy]

  def index
    @recipies = Recipe.order(created_at: :desc)

    render json: @recipies
  end

  def show
    render json: @recipe, scope: current_user
  end

  def create
      @recipe = Recipe.new recipe_params
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
    return if !current_user || current_user.id != @recipe.user_id
    if @recipe.update(recipe_update_params)
      render json: @recipe
    else
      render json: @recipe.errors, status: :unprocessable_entity
    end
  end

  def destroy
    return if !current_user || current_user.id != @recipe.user_id
    @recipe.destroy
  end

  def by_condition
    @recipes = Recipe.where("category_id = ?", params[:category_id]).order(created_at: :desc).first(4)
    @recipes = Recipe.order(created_at: :desc).first(4) unless @recipes.any?
    render json: @recipes, scope: current_user
  end

  private
    def set_recipe
      @recipe = Recipe.friendly.find(params[:id])
    end

    def recipe_params
      recipe = params.require(:recipe).permit(:title, :image, :summary, :time, :porsion, :complexity, :publish, :category_id)
      recipe[:sub_category_id] = params[:sub_category_id] unless (params[:sub_category_id]).to_i == 0
      recipe[:country_id] = params[:country_id] unless (params[:country_id]).to_i == 0
      recipe[:user_id] = current_user.id
      recipe[:user_type] = current_user.class.name
      recipe
    end

    def recipe_update_params
      params.require(:recipe).permit(:title, :summary, :time, :porsion, :complexity, :publish, :image, :category_id, :country_id, :sub_category_id)
    end

end
