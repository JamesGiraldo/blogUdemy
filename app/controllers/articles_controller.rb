class ArticlesController < ApplicationController
  def index
    @articulos = Article.all
  end

  def show

  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
       redirect_to @article
    else
       redirect_to :new
    end
  end
  private
  def article_params
    params.require(:article).permit(:title, :body)
  end
end
