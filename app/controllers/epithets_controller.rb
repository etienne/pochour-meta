class EpithetsController < ApplicationController
  def show
    @epithet = Epithet.find(params[:id])
    @current_community = Community.find(params[:community_id])
    @articles = Article.joins(epithet_votes: :epithet).where('articles.community_id' => @current_community.id, 'epithet_votes.epithet_id' => @epithet.id).group('articles.id')
    authorize @current_community
  end
end