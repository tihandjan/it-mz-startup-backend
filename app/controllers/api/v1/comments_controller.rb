class Api::V1::CommentsController < ApplicationController
    before_action :set_commentable_object

    def index
        @comments = @commentable.comments.order(created_at: :desc)
        render json: @comments
    end

    def create
        @comment = @commentable.comments.new comment_params
        if @comment.save
            render json: @comment, status: :created
        else
            render json: @comment.errors, status: :unprocessable_entity
        end
    end

    def destroy
        Comment.find(params[:id]).destroy
    end

    private

    def comment_params
        comment = params.require(:comment).permit(:content)
        comment[:user_id] = current_user.id
        comment[:user_type] = current_user.class.name
        comment
    end

    def set_commentable_object
        @commentable = Recipe.find_by_id(params[:recipe_id]) if params[:recipe_id]
    end
end