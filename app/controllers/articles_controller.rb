class ArticlesController < ApplicationController
  load_and_authorize_resource
  
  before_action :set_article, only: %i[ show edit destroy ]
  before_action :authenticate_user!, only: %i[ index new edit create update ]

  def index
    @articles = current_user.articles
  end

  def new
    @post = Article.new
  end

  def edit
  end

  def create
  @article = current_user.articles.build(article_params)
    respond_to do |format|
      if @article.save
        current_user.add_role :creator, @article
        flash[:notice] = "Article created successfully"
        format.html { redirect_to articles_path}
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def show
  end

  def update
    @article = current_user.articles.find(params[:id])
    respond_to do |format|
      if @article.update(article_params)
        current_user.add_role :editor, @article
        flash[:notice] = "Article created successfully"
        format.html { redirect_to article_path(@article) }  
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    if @article.destroy
      redirect_to articles_path, alert: "#{@article.title} has been deleted", notice: "Article has been deleted."
    else
      render :show, status: :unprocessable_entity
    end
  end

  protected
    def set_article
      @article = Article.friendly.find(params[:id])
    end
    
    def article_params
      params.require(:article).permit(:title, :body).merge(slug: params.dig(:article, :title))
    end
end
