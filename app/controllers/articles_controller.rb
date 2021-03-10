class ArticlesController < ApplicationController
  def show
    @article = Article.find(params[:id])
    @comment = Comment.new
  end

  def index
    @articles = Article.all  
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
    params.require(:article).permit(:title, :body, :image, category_ids: [])
  end
  
  def ensure_correct_user
    @article = Article.find(params[:id])
    unless @article.user == current_user
      redirect_to articles_path
    end
  end

end
