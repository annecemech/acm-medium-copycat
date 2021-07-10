class ArticlesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @articles = Article.where(visibility: "public")
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user = current_user
    @article.visibility = "public"
    if @article.save
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end

  def upvote
    @article = Article.find(params[:id])
    @article.votes += 1
    @article.save!
    redirect_to article_path(@article)
  end

  private

  def article_params
    params.require(:article).permit(:title, :rich_body, :photo)
  end
end
