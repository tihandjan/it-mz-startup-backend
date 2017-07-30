class Api::V1::CategoriesController < ApplicationController

  def index
    @category = Category.all
    render json: @category
  end

end
