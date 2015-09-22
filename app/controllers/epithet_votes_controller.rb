class EpithetVotesController < ApplicationController
  def create
    article = Article.find(params[:epithet_vote][:article_id])
    authorize article, :show?
    @epithet_vote = EpithetVote.new(epithet_vote_params)
    @epithet_vote.user = current_user
    @epithet_vote.epithet = Epithet.find_or_create_by(name: params[:epithet_vote][:epithet][:name].downcase)
    @epithet_vote.save!
    redirect_to article
  end
  
  private

  def epithet_vote_params
    params.require(:epithet_vote).permit(:article_id, :user_id, epithet_attributes: [:name])
  end
end
