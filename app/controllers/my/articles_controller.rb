class My::ArticlesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    if params[:query].present?
      @articles = Article.where("title ILIKE ?", "%#{params[:query]}%").where(user: current_user)
    else
      @articles = Article.where(user: current_user)
    end
  end

end
