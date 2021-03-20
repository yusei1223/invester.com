class BookmarksController < ApplicationController
  before_action :authenticate_user!

def create
  @bookmark = current_user.bookmarks.build(article_id: params[:id])
  @bookmark.save!
  redirect_back fallback_location: root_path, success: t('defaults.message.bookmark')
end

def destroy
  current_user.bookmarks.find_by(article_id: params[:id].destroy!)
  redirect_back fallback_location: root_path, success: t('defaults.message.not_bookmark')
end

end
