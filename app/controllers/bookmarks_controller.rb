class BookmarksController < ApplicationController
  before_action :authenticate_user!

 def create
  @article = Article.find(params[:article_id])
  bookmark = @article.bookmarks.new(user_id: current_user.id)
  bookmark.save
 end

 def destroy
  @article= Article.find(params[:article_id])
  bookmark = @article.bookmarks.find_by(user_id: current_user.id)
  # byebug
  bookmark.destroy
 end

end
