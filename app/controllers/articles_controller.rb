class ArticlesController < ApplicationController
  before_action :set_article, only: %i[ show edit destroy ]
  before_action :authenticate_user!, only: %i[ new edit create update ]

  def index
    @articles = Article.all
  end

  def new
    @post = Article.new
  end

  def edit
    unless @article.user.email.eql?(current_user.email)
      redirect_to articles_path, alert: "You're not authorized to edit this article"
    end
  end

  def create
    @article = Article.new(article_params.merge(user_id: current_user.id))
    byebug
    respond_to do |format|
      if @article.save!
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
        flash[:notice] = "Article created successfully"
        format.html { redirect_to article_path(@article) }  
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    unless @article.user.email.eql?(current_user.email)
      redirect_to articles_path, alert: "You're not authorized to edit this article"
    end
    if @article.destroy
      redirect_to articles_path, alert: "#{@article.title} has been deleted", notice: "Article has been deleted."
    else
      render :show, status: :unprocessable_entity
    end
  end

  protected
    def set_article
      @article = Article.find(params[:id])
    end
    
    def article_params
      params.require(:article).permit(:title, :body)
    end
end