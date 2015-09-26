class CommunitiesController < ApplicationController
  def new
    @community = Community.new
  end

  def create
    @community = Community.new(community_params)
    @community.users << current_user
    if @community.save
      redirect_to @community
    else
      render "new"
    end
  end
  
  def edit
    @community = Community.find(params[:id])
    @current_community = @community
    authorize @community
  end
  
  def update
    community = Community.find(params[:id])
    authorize community
    community.update!(community_params)
    redirect_to community
  end
  
  def show
    @community = Community.find(params[:id])
    @current_community = @community
    authorize @community
    @articles = @community.articles
    @epithets = Epithet.joins(epithet_votes: { article: :community }).where('articles.community_id' => @community.id).group(:id).order('RANDOM()').limit(12)
  end
  
  private

  def community_params
    params.require(:community).permit(:name, :public)
  end
end
