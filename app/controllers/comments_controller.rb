class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    authorize @comment.article, :show?
    @comment.user = current_user
    @comment.save
    redirect_to article_path(@comment.article, anchor: "comment-id-#{@comment.id}")
  end
  
  private

  def comment_params
    params.require(:comment).permit(:body, :article_id)
  end
end
