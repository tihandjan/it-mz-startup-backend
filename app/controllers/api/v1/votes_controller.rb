class Api::V1::VotesController < ApplicationController
  before_action :set_votable, only: [:create]  

  def create
    vote = @votable.votes.find_by(user_id: current_user.id)
    if vote.present?
      vote.destroy if vote.user_id == current_user.id
      render json: @votable.votes.count, status: 200
    else
      @data = @votable.votes.create(user_id: current_user.id)
      render json: @votable.votes.count, status: 200
    end
  end

  private

  def set_votable
    @votable = Recipe.find(params[:recipe_id]) if params[:recipe_id]
    @votable = Comment.find(params[:comment_id]) if params[:comment_id]
  end

end
