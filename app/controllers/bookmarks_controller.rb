class BookmarksController < ApplicationController
  before_action :set_article
  before_action :authenticate_user!

  def create
    if @article.user_id != current_user.id   
      @bookmark = Bookmark.create(user_id: current_user.id, article_id: @article.id)
    end
  end

  def destroy
    @bookmark = Bookmark.find_by(user_id: current_user.id, article_id: @article.id)
    @bookmark.destroy
  end

  private
  def set_article
    @article = Article.find(params[:article_id])
  end
end
