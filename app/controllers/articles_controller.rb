class ArticlesController < ApplicationController
  def new
    @article = Article.new
    @communities = current_user.communities
  end

  def create
    @article = Article.new(article_params)
    @article.user = current_user
    if @article.save
      redirect_to @article
    else
      render "new"
    end
  end
  
  def show
    @article = Article.find(params[:id])
    authorize @article
  end
  
  private

  def article_params
    params.require(:article).permit(:title, :body, :community_id)
  end
end
