class ArticlesController < ApplicationController

  def show
    @article = Article.find(params[:id])
    # @ converts to instance variable
  end

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(params.require(:article).permit(:title, :description))
    # render plain: @article
    if @article.save
      flash[:notice] = "New Article saved"
      redirect_to @article
    else
      render 'new'
      # instance variable available in 'new' template
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(params.require(:article).permit(:title, :description))
    # update does not require save
      flash[:notice] = 'Article updated successfully'
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end

end