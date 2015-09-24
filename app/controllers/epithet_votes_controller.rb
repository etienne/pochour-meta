class EpithetVotesController < ApplicationController
  def create
    @epithet_vote = EpithetVote.new(epithet_vote_params)
    @epithet_vote.user = current_user
    if epithet_id = params[:epithet_vote][:epithet_id]
      @epithet_vote.epithet = Epithet.find(epithet_id)
    else
      @epithet_vote.epithet = Epithet.find_or_create_by(name: params[:epithet_vote][:epithet][:name].downcase)
    end
    authorize @epithet_vote
    respond_to do |format|
      @epithet_vote.save!
      format.html { redirect_to Article.find(params[:epithet_vote][:article_id]) }
      format.json { head :created }
    end
  end
  
  def destroy
    @epithet_vote = EpithetVote.find(params[:id])
    authorize @epithet_vote
    respond_to do |format|
      @epithet_vote.destroy!
      format.json { head :no_content }
    end
  end
  
  private

  def epithet_vote_params
    params.require(:epithet_vote).permit(:article_id, :user_id, epithet_attributes: [:name])
  end
end
