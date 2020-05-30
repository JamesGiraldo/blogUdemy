class ArticlesController < ApplicationController
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
        format.html {redirect_to @article , alert: "Articulo #{@article.title} Modificado."}
        format.json {render :show, estatus: :created, location: @article}
      else
        render :edit, alert: "Problemas Al Modificar Articulo #{@article.title}."
        format.html {render :edit, alert: "Problemas Con La Grabacion."}
        format.json {render json: @article.errors, status: :unprocessable_entity}
      end
    end
  end

  def create
    @article = Article.new(article_params)
    respond_to do |format|
      if @article.save
         format.html {redirect_to @article , alert: "Articulo #{@article.title} Registrado."}
         format.json {render :show, estatus: :created, location: @article}
      else
         format.html {redirect_to :new , alert: "Problemas Con La Grabacion."}
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
