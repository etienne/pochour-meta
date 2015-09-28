class ArticlesController < ApplicationController
  def new
    @article = Article.new
    if params[:original_article_id]
      @original_article = Article.find(params[:original_article_id])
      authorize @original_article, :respond?
    end
    @current_community = params[:community_id] ? Community.find(params[:community_id]) : current_user.communities.first
    authorize @current_community, :edit?
  end

  def create
    @article = Article.new(article_params)
    authorize @article.community, :edit?
    if params[:original_article_id]
      authorize Article.find(params[:original_article_id]), :respond?
    end
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
    @current_community = @article.community
    authorize @article
  end

  def update
    @article = Article.find(params[:id])
    authorize @article
    
    respond_to do |format|
      if @article.update_attributes(article_params)
        format.html { redirect_to @article }
        format.json { respond_with_bip(@article) }
      else
        format.html { render action: "edit" }
        format.json { respond_with_bip(@article) }
      end
    end
  end

  def show
    @article = Article.find(params[:id])
    authorize @article
    @current_community = @article.community
    @comment = Comment.new
    @epithet_vote = EpithetVote.new
    @epithet_votes_by_current_user = @article.epithet_votes.where(user_id: current_user.id)
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
    params.require(:article).permit(:title, :body, :community_id, :original_article_id)
  end
end
