class ArticlesController < ApplicationController

  def show
    @article = Article.find(params[:id])
    @comment = Comment.new
    bookmarks = Bookmark.where(user_id: current_user.id).pluck(:article_id)  # ログイン中のユーザーのお気に入りのpost_idカラムを取得
    @Bookmark_list = Article.find(bookmarks)     # postsテーブルから、お気に入り登録済みのレコードを取得
  end

  def index
   #seach時にifで検索結果を表示させそうでないならelseを返し、全ての投稿を表示させる。
    if params[:q]
    @search_articles = @search.result(distinct: true).order(created_at: "DESC").includes(:user).page(params[:page]).per(5)
    else
    @search_articles = Article.all
    end
    @article = Article.new
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user_id = current_user.id
   if @article.save!
    redirect_to articles_path(@article), notice: "You have created book successfully."
   else
    @articles = Article.all
    render 'index'
   end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    if @article.update(article_params)
      redirect_to article_path(@article), notice: "You have updated book successfully."
    else
      render "edit"
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end

  private
  def article_params
    params.require(:article).permit(:title, :body, :image, :category_ids)
  end

  def ensure_correct_user
      @article = Article.find(params[:id])
    unless @article.user == current_user
      redirect_to articles_path
    end
  end

end