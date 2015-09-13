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
  
  def edit
    @article = Article.find(params[:id])
    @communities = current_user.communities
    authorize @article
  end

  def update
    article = Article.find(params[:id])
    authorize article
    article.update!(article_params)
    redirect_to article
  end

  def show
    @article = Article.find(params[:id])
    authorize @article
    @comment = Comment.new
  end
  
  def destroy
    @article = Article.find(params[:id])
    community = @article.community
    authorize @article
    @article.destroy
    redirect_to community
  end
  
  private

  def article_params
    params.require(:article).permit(:title, :body, :community_id)
  end
end
