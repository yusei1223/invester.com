class CommentsController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    #byebug
    comment = @article.comments.build(comment_params)
    comment.user_id = current_user.id
    comment.save
    @article.create_notification_comment!(current_user, comment.id)
  end

  def destroy
      @comment = Comment.find(params[:id])
    　@comment.destroy
  end


  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
