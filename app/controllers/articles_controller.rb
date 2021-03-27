class ArticlesController < ApplicationController
  before_action :authenticate_user!

  def bookmarks
    @bookmarks = Bookmark.where(user_id: current_user.id)
  end

  def show
    @article = Article.find(params[:id])
    @comment = Comment.new
  end

  def index
    # seach時にifで検索結果を表示させそうでないなら、全ての投稿を表示させる。
    @search_articles = if params[:q]
                         @search.result(distinct: true).order(created_at: 'DESC').includes(:user).page(params[:page]).per(9)
                       else
                         Article.all.page(params[:page]).per(9)
                       end
    @newarticles = Article.all.order(created_at: :desc).limit(10)
    @all_ranks = Article.find(Favorite.group(:article_id).order('count(article_id) desc').limit(3).pluck(:article_id))
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user_id = current_user.id
    if @article.save
      redirect_to articles_path(@article), notice: 'You have created book successfully.'
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
      redirect_to article_path(@article), notice: 'You have updated book successfully.'
    else
      render 'edit'
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
    redirect_to articles_path unless @article.user == current_user
  end

  def sort_params
    params.permit(:sort)
  end
end
