class CommentsController < ApplicationController
  before_action :set_article, only: [:new, :create]

  def new
    @comment = Comment.new(article_id: @article)
  end

  def create
    @comment = Comment.new(comments_params)
    @comment.article = @article
    @comment.user = current_user
    if @comment.save!
      redirect_to article_path(@article)
    else
      render "articles/show"
    end
  end

  private

  def set_article
    @article = Article.find(params[:article_id])
  end

  def comments_params
    params.require(:comment).permit(:content, :article_id)
  end

end
