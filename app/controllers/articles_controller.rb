class ArticlesController < ApplicationController

  before_action :require_login, except: [:show, :show_all]

  def index
    @articles=Article.order(created_at: :desc)
  end

  def new
  	@article=Article.new
  	@categories=Category.order(:name)
  end

  def create
    @article=Article.new(article_params)
    @article.user_id=current_user.id

    if params[:submit_publish]
      @article.published=true
    else
      @article.published=false
    end
    
    if @article.save
      redirect_to articles_path, notice: "Article has been published"
    else
      @categories=Category.order(:name)
      render 'new'
    end
  end

  def edit
    @article=current_user.articles.find_by_id(params[:id])
    redirect_to articles_path unless @article

    @categories=Category.order(:name)
  end

  def update
  	@article=current_user.articles.find_by_id(params[:id])
    redirect_to articles_path unless @article

    @article.attributes=article_params

    if params[:submit_publish]
      @article.published=true
    else
      @article.published=false
    end

    if @article.save
      redirect_to articles_path, notice: "Article has been updated"
    else
      @categories=Category.order(:name)
      render 'edit'
    end

  end

  def show_all
    @articles=Article.order(created_at: :desc)
  end

  def show
    @article=Article.find_by_id(params[:id])
    redirect_to root_path unless @article
  end

  private
  def article_params
  	params.require(:article).permit(:title,:body,:category_id)
  end

end
