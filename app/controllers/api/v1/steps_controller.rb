class Api::V1::StepsController < ApplicationController
  before_action :set_step, only: [:destroy]

  def create
    @step = Step.new(step: params[:step], content: params[:content], recipe_id: params[:recipe_id], image: params[:image])
    if @step.save
      render json: @step, status: :created
    else
      render json: @step.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @step.destroy    
  end  

  private
  
  def set_step
    @step = Step.find(params[:id])
  end

end
