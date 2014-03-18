class CommentsController < ApplicationController
  def new
  end

  def create
    @comment=Comment.new
    @comment.user_id = current_user.id
    @comment.real_estate_id = params[:comment][:id]
    @comment.comment = params[:comment][:comment]
    @comment.save
    flash[:success]="Bejegyzés mentve!"
    redirect_to real_estate_path(params[:comment][:id])
  end
end
