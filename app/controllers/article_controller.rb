class ArticleController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find_by(permalink: params[:id])
  end
end
