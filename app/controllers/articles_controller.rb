class ArticlesController < ApplicationController

  def show
    @article = Article.find(params[:id])
    # @ converts to instance variable
  end
end