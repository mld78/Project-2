class CommentsController < ApplicationController
  before_action :set_couplet

def create
  @comment = @couplet.comments.new(comment_params)
  @comment.user_id = current_user.id

  respond_to do |format|
  if @comment.save
    format.html { redirect_to @couplet, notice: 'Comment was successfully created.' }

  else
    format.html { redirect_to @couplet, notice: 'Comment was not created successfully created.' }
  end
end
end

def destroy
  @comment = @couplet.comments.find(params[:id])
  @comment.destroy
  redirect_to root_path
end

private

def comment_params
  params.require(:comment).permit(:substance)
end

def set_couplet
  @couplet = Couplet.find(params[:couplet_id])
end
end
