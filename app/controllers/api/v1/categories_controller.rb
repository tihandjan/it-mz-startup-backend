class Api::V1::CategoriesController < ApplicationController
  before_action :set_category, only: [:show]
  def index
    @category = Category.all
    render json: @category
  end

  def show
    render json: @category
  end

  private
  
    def set_category
      @category = Category.friendly.find(params[:id])
    end
end
