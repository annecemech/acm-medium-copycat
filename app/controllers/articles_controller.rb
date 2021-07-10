class ArticlesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_article, only: [:show, :upvote, :update_visibility]

  def index
    if params[:query].present?
      @articles = Article.where("title ILIKE ?", "%#{params[:query]}%").where(visibility: "public")
    else
      @articles = Article.where(visibility: "public")
    end
  end

  def show
    @comment = Comment.new
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.votes = 0
    @article.user = current_user
    @article.visibility = "public"
    if @article.save
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end

  def upvote
    @article.votes += 1
    @article.save!
    redirect_to article_path(@article)
  end

  def update_visibility
    if @article.visibility == "privé"
      @article.visibility = "public"
    else
      @article.visibility = "privé"
    end
    @article.save!
    redirect_to my_articles_path
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :rich_body, :photo)
  end
end
