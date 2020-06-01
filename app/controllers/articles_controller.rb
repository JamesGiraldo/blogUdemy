class ArticlesController < ApplicationController
  before_action :authenticate_admin!, only: [:destroy]
  before_action :authenticate_editor!, only: [:edit, :update, :new, :create]
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  def index
    @articles = Article.all
  end

  def show
  end

  def new
    @article = Article.new
  end

  def edit
  end

  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html {redirect_to @article , notice: "Articulo #{@article.title} Modificado."}
        format.json {render :show, estatus: :created, location: @article}
      else
        format.html {render :edit}
        format.json {render json: @article.errors, status: :unprocessable_entity}
      end
    end
  end

  def create
    @article = current_user.articles.new(article_params)
    respond_to do |format|
      if @article.save
         format.html {redirect_to @article , notice: "Articulo #{@article.title} Registrado."}
         format.json {render :show, estatus: :created, location: @article}
      else
         format.html { render :new }
         format.json {render json: @article.errors, status: :unprocessable_entity}
      end
    end
  end

  def destroy
    @article.destroy
    respond_to do |format|
      format.html {redirect_to articles_url, alert: "Articulo Eliminado"}
      format.json {head :no_content}
    end
  end

  private
  def article_params
    params.require(:article).permit(:title, :body)
  end
  def set_article
    @article = Article.find(params[:id])
  end
end
