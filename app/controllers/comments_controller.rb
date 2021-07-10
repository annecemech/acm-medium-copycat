class CommentsController < ApplicationController

  def new
    @article = Article.find(params[:article_id])
    @comment = Comment.new(article_id: @article)
  end

  def create
    @article = Article.find(params[:article_id])
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

  def comments_params
    params.require(:comment).permit(:content, :article_id)
  end

end
