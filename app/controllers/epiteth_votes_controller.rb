class EpitethVotesController < ApplicationController
  def create
    article = Article.find(params[:epiteth_vote][:article_id])
    authorize article, :show?
    @epiteth_vote = EpitethVote.new(epiteth_vote_params)
    @epiteth_vote.user = current_user
    @epiteth_vote.epiteth = Epiteth.where(name: params[:epiteth_vote][:epiteth][:name].downcase).first_or_create
    @epiteth_vote.save
    redirect_to article
  end
  
  private

  def epiteth_vote_params
    params.require(:epiteth_vote).permit(:article_id, :user_id, epiteth_attributes: [:name])
  end
end
