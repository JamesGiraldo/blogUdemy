class ArticlesController < ApplicationController
  before_action :authenticate_admin!, only: [:destroy]
  before_action :authenticate_editor!, only: [:edit, :update, :new, :create]
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def search
    if params.has_key?(:titulo) && params[:titulo].length > 0
      @articles = Article.titulo(params[:titulo]).paginate(:page => params[:page], :per_page => 10 )
    else
      @articles = Article.all.paginate(:page => params[:page], :per_page => 10 )
    end
  end

  def index
    @articles = Article.paginate(:page => params[:page], :per_page => 10 ).ultimos
    if user_signed_in? && current_user.is_editor? && !params.has_key?(:normal)
      render :"admin_article"
    end
  end

  def show
    @comment = Comment.new
  end

  def new
    @article = Article.new
    @categories = Category.all
  end

  def edit
  end

  def update
    @article.categories = @article.categories.ids
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
    @article.categories = params[:categories]
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
    if @article.destroy
      respond_to do |format|
        format.html {redirect_to article_path, alert: "Articulo Eliminado"}
        format.json {head :no_content}
      end
    end
  end

  private
  def article_params
    params.require(:article).permit(:title, :body, :categories, :img_art)
  end
  def set_article
    @article = Article.find(params[:id])
  end
end
