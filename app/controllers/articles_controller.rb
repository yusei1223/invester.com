class ArticlesController < ApplicationController
  def show
  end

  def index
    @articles = Article.all  
  end
  
  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
   if @article.save!
    redirect_to articles_path(@article), notice: "You have created book successfully."
   else
    @articles = Article.all
    render 'index'
   end
  end

  private
  def article_params
    params.require(:article).permit(:title, :body, :image)
  end
end
